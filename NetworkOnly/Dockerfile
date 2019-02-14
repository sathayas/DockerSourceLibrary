FROM ubuntu

# Install software tools
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get upgrade && apt-get update && apt-get install -y \
    	    python3 \
	    python3-pip \
	    python3-tk \
	    graphviz \
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


