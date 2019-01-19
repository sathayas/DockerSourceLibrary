FROM ubuntu
RUN apt-get upgrade && apt-get update && apt-get install -y python3 python3-pip
COPY . /tmp
WORKDIR /tmp
RUN pip3 install -r requirements.txt
RUN echo 'alias jnb="jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"' >> ~/.bashrc

# Spell chekcer for Jupyter notebook
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable spellchecker/main
