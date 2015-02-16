# Tacx-frontend

Web client for Tacx Cloud

## Install dependencies

*Installation for Windows is missing yet*

We use [Docker](https://www.docker.com/whatisdocker/)

Install Docker for Ubuntu:

~~~
sudo apt-get install docker.io;
~~~

Install Docker for Mac OS X, see: https://docs.docker.com/installation/mac/

## Build and develop

In case you are a Mac OS X user, start Docker(boot2docker) using Spotlight and then use this command in terminal:

~~~
eval `boot2docker shellinit | grep export`;
~~~

To build the app use the command:

~~~
make frontend;
~~~

Once ready, you can open the web client with this command (in a new tab):

~~~
open http://$(boot2docker ip):8080
~~~

You can now start with developing. The output files for production are stored in bin/, while the files that are used during development are stored in build/.

## Deploy

*Pending*