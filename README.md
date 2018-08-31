# Android Testing Docker Image
A dockerfile and other files that are needed for the container to function properly. 
It is based and works as a layer around the following docker image https://hub.docker.com/r/runmymind/docker-android-sdk/

## Setup
Make sure that docker is installed, and build the docker file 

e.g.  docker build -t so/androidtesting ./path/to/dockerfile/

Make sure that the device the image is going to work on has kvm set up. 
Make sure nested virtualization is enabled. 
Make sure to expand the container size limit from 10 to 15 or more gigs. This image can get BIG.

## Usage
What you need to start things off is just add in a shell script to your project and customize it. 
Add the project as a volume, and customize a shell script within. 

As an example: 
docker run -it -v /home/git/rap-android:/repo so/androidtesting:latest sh /repo/exampleshellscript.sh

the example file provided can show you what has been done to the android project provided. 

## Customization
Extra-package-list can be updated to add in any extra android packages that need to be downloaded for the testing. 
Added was the image to run the emulator. 

The project and shell are left out to be added as volumes because the image is only supposed to handle setting up the environment. 


