# What is Docker and why should I use it?

**Docker** is a software tool that lets you run a collection of software packages and libraries, known as a Docker image, as if you are running a virtual machine (a computer inside your computer). A **Docker image** is self-contained, so you do not have to do any complicated installation processes (except Docker).


# Getting Docker on your computer

First, your computer has to have **Docker** installed, if it has not been installed already. If your computer is relatively new, then you can download and install **Docker for Windows** or **Docker for Mac**. The link for downloading, as well as the documentation for installation are available at:

  * [Docker for Windows](https://docs.docker.com/docker-for-windows/install/)
  * [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)

If your computer is somewhat old (like mine), then I recommend installing **Docker Toolbox** instead. The download link and the documentation are available at:

  * [Docker Toolbox for Windows](https://docs.docker.com/toolbox/toolbox_install_windows/)
  * [Docker Toolbox for Mac](https://docs.docker.com/toolbox/toolbox_install_mac/)

Once Docker is installed on your computer, ***you can run docker commands on a bash-style shell (i.e., Linux-style terminal)***, most likely via the Command Prompt (Windows) or the Terminal (Mac). See the corresponding documentation from the links above. To test the installation, run the following command:
```
docker run hello-world
```
If Docker is correctly installed on your computer, you should see a message:
```

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

...
```

*If you are a Linux user, then the installation of Docker is more complicated, and varies depending on your distribution. I recommend consulting the [Docker website](https://docs.docker.com/install/) for more details.*



# Getting the Docker image

## Contents of the Docker image
Now that Docker is installed on your computer, you are ready to download a **Docker image**. A Docker image is a bundle of software packages and libraries. Thanks to Docker, installing these software tools and libraries is a breeze! The Docker image available here, **`sathayas/python-fsl-bundle`** (2.7GB), contains FSL (a neuroimaging data analysis tool) and Python 3. Also contained are the following software packages:
* **Graphviz**: A network visualization software package
* **MRIcron**: A brain image viewing tool
* **FSLeyes**: Another brain image viewing tools (developed by FSL). Allows viewing of 4D images.
 
Just FYI, this docker image contains the following Python libraries:
  * Numpy
  * Scipy
  * Matplotlib
  * Pandas
  * IPython
  * Jupyter
  * networkX
  * Python-Louvain
  * Graphviz
  * Nibabel
  * Nipype
  * PyBIDS
  * Nilearn
  * Scikit-learn
  * Scikit-image

## Getting the Docker image
To install a Docker image, simply run the following command:
```
docker pull sathayas/python-fsl-bundle
```
To verify if the Docker image has been correctly downloaded, run the following command:
```
docker images
```
Then you should see an output like this:
```
REPOSITORY                       TAG                 IMAGE ID            CREATED             SIZE
sathayas/python-fsl-bundle       latest              85ab7ee15add        17 minutes ago      2.7GB
```


## Source code

If you are an advanced user and would like to *hack* this Docker image, you can see the **`Dockerfile`** at the repository https://github.com/sathayas/DockerSourceLibrary/tree/master/PythonFSL .



# Running the Docker image

To run the Docker image, run the command:
```
docker run -it --rm -p 8888:8888 sathayas/python-fsl-bundle
```
And this should change the prompt on your terminal to a prompt of an Ubuntu virtual machine (a popular distribution of Linux). From here, you can start IPython (an interactive Python shell) by the command **`ipython`**, which invokes an IPython session:
```
root@6cb65af29966:/tmp# ipython
Python 3.6.7 (default, Oct 22 2018, 11:32:17) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.2.0 -- An enhanced Interactive Python. Type '?' for help.

In [1]:                                                                                                                                                        

```
You can copy and paste a Python code from a Python editor on your computer. *One downside of running a Docker image is that you cannot generate any graphical outputs to be displayed on the screen.* If you want to generate graphical outputs, you need to (1) run **Jupyter notebook**, or (2) set up **X11 forwarding** (*for advanced users. See below*).



# Running Jupyter notebook


**Jupyter notebook** lets you edit and run Python codes embedded in a notebook document via your web browser. You can display images and plots generated by Python inside your browser. To start Jupyter notebook, you can run the command **`jnb`** at the command prompt for the Ubuntu Docker container (container = an instance of a running Docker image) your terminal. This command is a shorthand notation (i.e., alias) for the command:
```
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
```
Then you will see a message on your terminal like this one:
```
...
    To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-10-open.html
    Or copy and paste one of these URLs:
        http://(ff3070aa4710 or 127.0.0.1):8888/?token=713283a6a2ec82df89844332699c31e3567910a6274a9e14
```
Then open your favorite web browser on your computer, and set the URL to either:
* `http://192.168.99.100:8888/?token=713283a6a2ec82df89844332699c31e3567910a6274a9e14`
* `http://localhost:8888/?token=713283a6a2ec82df89844332699c31e3567910a6274a9e14`

The important thing to note here is that the string
```
?token=713283a6a2ec82df89844332699c31e3567910a6274a9e14
``` 
needs to be copied from the terminal to you web browser. This string identifies which session of Jupyter notebook is displayed on your web browser.


# How to display GUIs from Docker (Advanced users)

You can display graphical windows (e.g. GUIs, figures, etc.) from the Docker container, by setting up X11 forwarding. Unfortunately this process is specific to your OS, and most likely requires installation of additional software package(s). Rather than describing the process in details, I refer interested users to two blog posts by people who have succeeded in setting up.
* **Mac**: From Sourab Bajaj's [blog](https://sourabhbajaj.com/blog/2017/02/07/gui-applications-docker-mac/)
* **Windows 10**: From RobsCode [blog](https://robscode.onl/docker-run-gui-app-in-linux-container-on-windows-host/)
* **Linux**: Very hard - I haven't figured out



# Mounting a folder

When you run a Docker image (referred as a **Docker container**) on your computer, the resulting Docker container runs as if it is independent of your local computer. This means that it has its own separate directories and files, that are not visible from your local computer.

However, you can share a folder on your local computer with a Docker container. This is done by using the **`-v`** parameter on `docker run` command. Here is an example of how you can map a Jupyter notebook folder on your computer (e.g., one you cloned from GitHub) to the Jupyter notebook folder inside this particular Docker image:

```
docker run -it --rm -p 8888:8888 \
-v [Path to Notes folder]:/tmp/Notes:z \
[Docker image name]
```

Here, the folder indicated by **`[Path to Notes folder]`** is mapped to **`/tmp/Notes`** directory inside the Docker container. So you will be able to view, edit, create, and save documents to this directory inside a Docker container and such changes are preserved in the `Notes` folder on your local computer.

It is possible to mount multiple folders to a Docker image. For example,
```
docker run -it --rm -p 8888:8888 \
-v [Path to Notes folder]:/tmp/Notes:z \
-v [Path to Codes folder]:/tmp/Codes:z \
-v [Path to Data folder]:/tmp/Data:z \
[Docker image name]
```

This way, the directories for notes, codes, and data are mounted to the Docker image virtual machine and are available under the `/tmp` directory.
