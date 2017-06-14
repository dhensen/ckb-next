# Runing ckb-next in a Docker Container

At the moment only the daemon runs in the container.

# Build the container
```
docker build -t ckb-next-arch:latest .
```

# Run the container (on Linux)
The following command runs the ckb-daemon inside a docker container:
```
docker run -d --privileged --cap-add=ALL \
    -v /lib/modules:/lib/modules \
    -v /dev/uinput:/dev/uinput \
    -v /dev/input:/dev/input \
    ckb-next-arch:latest
```

TODO:
 - [ ] Also run the GUI app in a container
 - [ ] Find out exactly which capabilities the container need, instead of shotgun approach.
 - [ ] OSX needs to mount other devices into the container.
 - [ ] Make running with group id for single user configurable.