# *****************************************
# Dockerfile to build complete GTex Jupyter
# working notebook
# *****************************************
FROM jupyter/scipy-notebook
MAINTAINER Mike Garcia "mgarcia@b1ackbean.com"
RUN mkdir $HOME/work/gtex
RUN mkdir $HOME/work/nb

WORKDIR /m01/UNM/jupyter-nb/
ADD  gtex_*.ipynb $HOME/work/nb/
ADD gtex $HOME/work/gtex

WORKDIR $HOME