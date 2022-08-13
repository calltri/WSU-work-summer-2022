The intention of using PhaME was to create phylogenetic trees that we could then combine to make tanglegrams with.


# Install/Setup 
Other methods of installation of PhaME exist on their website here: https://phame.readthedocs.io/en/latest/introduction/introduction.html but be warned the documentation is inconsistent and outdated at times.

The method of installing via Anaconda appears entirely broken from my testing on Windows and Linux.

One other way that can work with some effort is a way to install the webapp server job version but it isn't seemless and is probably overkill for what were doing.

## Installing via Docker (Windows)
The fastest and easiest method on windows (and probably on most others from what I've seen) is to use Docker. I've updated the instructions on their doc to use the latest version as of 7/12/2022 below.

**For Context**: Docker is a way of running software in a mini virtual machine. This can be convienent for scaling applications across many servers or in our case having a singular package which comes pre-packaged with all the 3rd party libraries/versions/etc all sorted. It also works cross platform. 

1. Install docker from [here](https://docs.docker.com/desktop/windows/install/)
2. Download PhaME's image by running this command:
```sh
docker pull quay.io/biocontainers/phame:1.0.3--1
```
3. You can test that everything is installed and ready to use with the following command
```sh
docker run --rm quay.io/biocontainers/phame:1.0.3--1 bash -c 'phame --vcheck'
```

# Running
1. Copy the TEMPLATE folder elseware and rename it something.
2. Place any reference genomes you wish to use in the **refdir** folder
3. Place any contigs in the **workdir** folder. Importantly, rename the file extension of these files to .contig. This is how PhaME finds them and it will not work without them renamed. 
4. Open Gitbash in folder your created in step 1. This can be done by opening that folder in file explorer and right clicking in the empty space of the window->more options->open gitbash
5. Run `./run.sh` It will take a long time to run so once it starts running NUCmer your safe to leave it and come back sometime later.  
6. After it finishes go to `output/<timestamp>` to view the output PhaME created. 



