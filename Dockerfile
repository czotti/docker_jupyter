FROM jupyter/notebook
MAINTAINER Clement ZOTTI <clement.zotti@usherbrooke.ca>
RUN apt-get update
RUN apt-get -y install liblapack-dev libblas-dev
RUN apt-get -y install gcc gfortran make
RUN apt-get -y install libpng3 libfreetype6-dev

# Python 3 environment
RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install scikit-learn
RUN pip3 install matplotlib

# Python 2 environment
RUN pip2 install numpy
RUN pip2 install scipy
RUN pip2 install scikit-learn
RUN pip2 install matplotlib

EXPOSE 8888

CMD jupyter notebook