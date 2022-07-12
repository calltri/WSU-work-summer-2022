
# Install/Setup 
Other methods of installation of PhaME exist on their website here: https://phame.readthedocs.io/en/latest/introduction/introduction.html but the documentation is rather out of date and inconsistent.

The method of installing via Anaconda appears entirely broken. Or at least I havent been able to get Anaconda to behave. 

Notably there is a way to install it on a production server and get email notifications if interested but the docker requirement files require a lot of modification to fix version issues. I also had to modify some of the source python files which lacked an import for some reason. 

## Installing via Docker (Windows)
The fastest and easiest method on windows (and probably on most others from what I've seen) to use Docker. I've updated the instructions on their doc to use the latest version as of 7/12/2022 below.

For context: Docker is a way of running an app in a mini virtual machine, this can be convient for scaling applications accross many servers or in our case having a singular package which comes pre-packaged with all the 3rd party libraries/versions/etc all sorted. 

1. Install docker: https://docs.docker.com/desktop/windows/install/

2. Download PhaME's image: 

```
docker pull quay.io/biocontainers/phame:1.0.3--1
```

# Running
For our use case I've been following this guide: https://phame.readthedocs.io/en/latest/usage/cases.html?highlight=contig#with-complete-genomes-and-contigs

It too has inconsistenties like sometimes referring to a different image from a different distro altogether though so I will try to summarize the controls I've found to actually work (and be the latest 3 yeare old version) below. 

NOTE: Don't use the git bash terminal for these steps, it doesn't play well with mounting folders with docker (docker run -v). Source: https://github.com/docker-archive/toolbox/issues/673

@TODO Finish writing doc!
docker run --rm -t -v ${pwd}/phame_examples/ecoli:/data quay.io/biocontainers/phame:1.0.3--0
