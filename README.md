# Jupyter Notebooks for UNM Data Commons Project
## Steps to run container
1. Clone this repository
1. Copy any GTex required files to ./jupyter-nb/gtex directory
1. Build the docker image:
```docker build -t unm/jupyter-nb:v1 .```
1. Run the container
```docker run --name jupyter -d -p 8888:8888 unm/jupyter-nb:v1```
1. Read the Jupyter server logs by doing
```docker logs --tail=all jupyter```. The output will have a URL like so
```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://bbc25d1f331f:8888/?token=2ad39d07c47f3d98a65d866456b741f8ff569cce9a288541&token=2ad39d07c47f3d98a65d866456b741f8ff569cce9a288541
```
Replace the host with our server chiltepin.health.unm.edu 
1. Once there [navigate](http://chiltepin.health.unm.edu:8888/tree/work/nb) to the nb directory and open the GTEx notebook.  From here we can run, change, explore in any manner.  

---
**NOTE**  This notebook is only setup to use GTEx content that is pre-baked into the container at build time
