FROM jupyter/notebook
MAINTAINER Clement ZOTTI <clement.zotti@usherbrooke.ca>

RUN apt-get update
RUN apt-get -y install liblapack-dev libblas-dev
RUN apt-get -y install gcc gfortran make

# Install png, freetype and jpeg for pillow and matplotlib
# Install hdf5 for h5py
RUN apt-get -y install libpng3 libfreetype6-dev libhdf5-serial-dev libjpeg-dev

# Python 3 environment
RUN pip3 install Cython
RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install scikit-learn
RUN pip3 install matplotlib
RUN pip3 install scikit-image
RUN pip3 install pandas
RUN pip3 install h5py

# Python 2 environment
RUN pip2 install Cython
RUN pip2 install numpy
RUN pip2 install scipy
RUN pip2 install scikit-learn
RUN pip2 install matplotlib
RUN pip2 install scikit-image
RUN pip2 install pandas
RUN pip3 install h5py

EXPOSE 8888

CMD jupyter notebook