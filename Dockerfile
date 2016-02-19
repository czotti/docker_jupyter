FROM jupyter/notebook
MAINTAINER Clement ZOTTI <clement.zotti@usherbrooke.ca>

run apt-get update
# Install png, freetype and jpeg for pillow and matplotlib
# Install hdf5 for h5py
RUN apt-get -y install liblapack-dev libblas-dev gcc gfortran make libpng3 libfreetype6-dev libhdf5-serial-dev libjpeg-dev

# Python 3 environment
RUN pip3 install Cython &&\
    pip3 install numpy &&\
    pip3 install scipy &&\
    pip3 install scikit-learn &&\
    pip3 install matplotlib &&\
    pip3 install scikit-image &&\
    pip3 install pandas &&\
    pip3 install theano &&\
    pip3 install nibabel &&\
    pip3 install ipdb &&\
    pip3 install h5py

# Python 2 environment
RUN pip2 install Cython &&\
    pip2 install numpy &&\
    pip2 install scipy &&\
    pip2 install scikit-learn &&\
    pip2 install matplotlib &&\
    pip2 install scikit-image &&\
    pip2 install pandas &&\
    pip3 install theano &&\
    pip3 install nibabel &&\
    pip3 install ipdb &&\
    pip2 install h5py

EXPOSE 8888

CMD jupyter notebook
