#!/bin/bash

NAME=cleardebian
docker kill $NAME
docker run --rm -dit --name $NAME cleardebian:latest
