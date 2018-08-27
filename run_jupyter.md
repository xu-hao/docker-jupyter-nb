```
docker run --privileged -d --name dc_jupyter           \
       -e CHRONOS_URL=${CHRONOS}                       \
       -e IRODS_PORT=${IRODS_PORT}                     \
       -e IRODS_HOST=${IRODS_HOST}                     \
       -e IRODS_HOME=${IRODS_HOME}                     \
       -e IRODS_CWD=${IRODS_CWD}                       \
       -e IRODS_USER_NAME=${IRODS_USER_NAME}           \
       -e IRODS_PASSWORD=${IRODS_PASSWORD}             \
       -e IRODS_ZONE_NAME=${IRODS_ZONE_NAME}           \
       -p 8888:8888 -p 90:80                           \
       --volume ~/dev:/home/dockeruser/hdev            \
       heliumdatacommons/datacommons-jupyter2          \
       jupyter
```
