This is my first time trying to work with docker containers.

# Python 2 & 3 jupyter server

Install on this docker:

	numpy
	scipy
	scikit-learn

# Build
Clone the repository

	git clone https://github.com/czotti/docker_jupyter.git
	docker build . -t czotti/jupyter

# Run
Running the container

	docker run --name jupyter -d -p 8888:8888 czotti/jupyter

Or if you want to save notebook on your system

    docker run --name jupyter -d -p 8888:8888 -v /path/in/system/notebooks:/notebooks czotti/docker_jupyter

