FROM ubuntu

# Install software tools
RUN apt-get upgrade && apt-get update && apt-get install -y \
    	    python3 \
	    python3-pip \
	    graphviz \
	    wget \
	    jq \
	    git

# installing Python libraries
COPY . /tmp
WORKDIR /tmp
RUN pip3 install -r requirements.txt

# setting alias for Jupyter notebook
RUN echo 'alias jnb="jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"' >> ~/.bashrc

# Spell chekcer for Jupyter notebook
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable spellchecker/main

# install neurodebian
RUN wget -O- http://neuro.debian.net/lists/xenial.us-tn.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
RUN apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

# install fsl
RUN apt-get install -y fsl-complete

# setting up FSL path
ENV FSLDIR=/usr/share/fsl/5.0
ENV PATH=$PATH:$FSLDIR/bin

