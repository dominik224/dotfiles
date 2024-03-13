FROM debian:latest
WORKDIR /root
# TODO:
#       Create docker compose file

RUN apt update
RUN apt -y install sudo git tmux gcc wget tar
RUN apt -y install python3.11 python3.11-venv

# GOLANG
RUN wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz && rm ~/go1.22.1.linux-amd64.tar.gz
RUN echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile

# NEOVIM
RUN apt -y install ninja-build gettext cmake unzip curl build-essential file
RUN git clone https://github.com/neovim/neovim.git
RUN cd neovim \
    && git checkout v0.9.5 \
    && make CMAKE_BUILD_TYPE=RelWithDebInfo \
    && cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
RUN rm -rf /root/neovim

# CREATE USER
RUN useradd -m 'docker' && echo 'docker:docker' | chpasswd && adduser docker sudo && adduser docker root
USER docker
WORKDIR /home/docker

# TMUX
RUN mkdir -p ~/.tmux/plugins
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# GET & LOAD DOTFILES
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN mkdir /home/docker/setup
COPY bootstrap.sh /home/docker/setup/.
COPY tmux /home/docker/setup/tmux/
COPY nvim /home/docker/setup/nvim/
RUN /bin/sh ~/setup/bootstrap.sh

# ENV VARS
RUN echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
RUN echo "source ~/.bash_aliases" >> ~/.bashrc

# SOME ALIASES
RUN echo "alias vim=nvim" >> ~/.bash_aliases
RUN echo "alias vi=nvim" >> ~/.bash_aliases

CMD ["/bin/sh"]
