FROM base/archlinux
MAINTAINER Clement ZOTTI <clement.zotti@usherbrooke.ca>


RUN pacman-key --populate
RUN pacman-key --refresh-keys
RUN pacman -Sy --noprogressbar --noconfirm

RUN pacman -Syyu --noprogressbar --noconfirm
RUN pacman-db-upgrade


RUN pacman -S --noprogressbar --noconfirm base-devel python2 python3 \
    lapack blas python{2,}-numpy python{2,}-pip python{2,}-pandas \
    python{2,}-scikit-learn python-h5py hdf5 jupyter-notebook \
    python{2,}-numexpr git

RUN pacman -Scc --noconfirm

RUN git clone git://github.com/Theano/Theano.git && \
    cd Theano && \
    python setup.py develop --user && \
    python2 setup.py develop --user

RUN pip2 install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.7.1-cp27-none-linux_x86_64.whl

#RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.7.1-cp34-none-linux_x86_64.whl

RUN pip install nibabel ipdb
RUN pip2 install nibabel ipdb

RUN mkdir notebooks

ADD ./jupyter.sh /

EXPOSE 8888

CMD ./jupyter.sh
