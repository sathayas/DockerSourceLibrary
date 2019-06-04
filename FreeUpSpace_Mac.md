***Information in this document pertains to Docker Toolbox on Mac, explaining steps on how to free up diskspace 
by removing Docker related files***

### Step 1: Remove machines

First, get a list of machines by
```
docker-machine ls
```
and delete them by
```
docker-machine rm [name of machine]
```



### Step 2: Remove Docker toolbox folder

It should be located under the Application folder



### Step 3: Remove Kitematic

By running the command
```
rm -fr ~/Library/Application\ Support/Kitematic
```


### Step 4: Run `uninstall.sh`

This step requires **administrator previlage**. Run **`uninstall.sh`** script by
```
sudo bash uninstall.sh
```
and that should remove all the files associated with Docker.



### Step 5: Remove hidden `.docker` directory

Remove the hidden `.docker` directory under the home directory.
```
rm -rfv ~/.docker
```


### Step 6: Re-install Docker toolbox

See the [documentation](https://docs.docker.com/toolbox/toolbox_install_mac/)
