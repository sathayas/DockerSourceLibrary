FROM neurodebian:xenial

COPY sources /etc/apt/sources.list.d/neurodebian.sources.list

# Install software tools
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get upgrade && apt-get update && apt-get install -y \
    	python \
    	python3 \
	    python3-pip \
      python3-tk \
	    graphviz \
	    wget \
	    jq \
	    libopenblas-base \
	    mricron \
	    git \
      fsl-core


# installing Python libraries
COPY . /tmp
WORKDIR /tmp
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# setting alias for Jupyter notebook
RUN echo 'alias jnb="jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"' >> ~/.bashrc

# Spell chekcer for Jupyter notebook
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable spellchecker/main

# Configure environment for FSL
ENV FSLDIR=/usr/lib/fsl/5.0
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV PATH=$PATH:$FSLDIR
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FSLDIR

# Run configuration script for normal usage
RUN echo ". /etc/fsl/5.0/fsl.sh" >> /root/.bashrc

# setting some variables
ENV LD_LIBRARY_PATH=/usr/lib/openblas-base/
ENV USER=root

# FSLeyes installation -- first, preparation
RUN pip3 install -f https://extras.wxpython.org/wxPython4/extras/linux/gtk2/ubuntu-16.04 wxpython
RUN apt-get install -y build-essential && \
    apt-get install -y libgtk2.0-dev libgtk-3-dev \
                       libwebkitgtk-dev libwebkitgtk-3.0-dev && \
    apt-get install -y libjpeg-turbo8-dev libtiff5-dev \
                       libsdl1.2-dev libgstreamer1.0-dev \
                       libgstreamer-plugins-base1.0-dev \
                       libnotify-dev freeglut3-dev

# Actual FSLeyes installation via pip3
RUN pip3 install fsleyes
