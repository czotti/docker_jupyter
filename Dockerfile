FROM base/archlinux
MAINTAINER Clement ZOTTI <clement.zotti@usherbrooke.ca>

# Upgrade pacman package and keys
RUN pacman-key --populate && \
    pacman-key --refresh-keys && \
    pacman -Sy --noprogressbar --noconfirm archlinux-keyring && \
    pacman -Syyu --noprogressbar --noconfirm && \
    pacman-db-upgrade && \
    trust extract-compat

# Install python and all dependencies needed
RUN pacman -S --noprogressbar --noconfirm base-devel
RUN pacman -S --noprogressbar --noconfirm python2 python3 \ 
    lapack blas python{2,}-numpy python{2,}-pip python{2,}-pandas \
    python{2,}-scikit-learn python-h5py hdf5 jupyter-notebook \
    python{2,}-numexpr git ipython2-notebook cuda mathjax

# Clear pacman cache to reduce image size
RUN pacman -Scc --noconfirm

# Install theano for gpu computing
RUN git clone git://github.com/Theano/Theano.git && \
    cd Theano && \
    python setup.py develop --user && \
    python2 setup.py develop --user

# Install tensorflow (Not working for now)
#RUN pip2 install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.7.1-cp27-none-linux_x86_64.whl && \
#    pip install --upgrade http://ci.tensorflow.org/view/Nightly/job/nigntly-matrix-linux-gpu/TF_BUILD_CONTAINER_TYPE=GPU,TF_BUILD_IS_OPT=OPT,TF_BUILD_IS_PIP=PIP,TF_BUILD_PYTHON_VERSION=PYTHON3,label=gpu-slave/lastSuccessfulBuild/artifact/pip_test/whl/tensorflow-0.7.0-py3-none-any.whl

# Install convenient library for python distribution
RUN pip install nibabel ipdb && \
    pip2 install nibabel ipdb

RUN mkdir notebooks
ADD ./jupyter.sh /
EXPOSE 8888
CMD ./jupyter.sh
