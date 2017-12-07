# docker-netatalk
An extension of cptactionhank/docker-netatalk specifically for time machine.


## Installation

Build the Docker image with a password. The default username is `tmroot`. This can be 
changed by adding `--build-arg username=[username here]` and updating afp.conf.

```sh
$ docker build -t my/netatalk --build-arg password=[password here] .
```

Edit `docker-compose.yml` as necessary. Most likely you will need to change the host 
volume location from the default `/data2/TimeMachine`.

Start the server:
```sh
$ docker-compose up -d
```

On a Mac, go to Finder's Connect to Server (Go -> Connect to Server ⌘K) and type in `afp://[ip address of the server]`. (I was unable to make this work with LAN hostnames. If you know a way, please tell me.) 

It will prompt you for your username and password for the server we just set up. The username is `tmroot` by default. The password is whatever password you set when building the docker image.

The TimeMachine share should now be mounted.

In the Time Machine app, the share should now appear as a possible backup location.

## Troubleshooting

If the share does not appear in Time Machine, make sure that the permissions on the volume directory on 
the host are permissive enough. 

These permissions do not allow `tmroot` to write to the TimeMachine volume.
```sh
# ls -l
drwxr-xr-x 2 root    root    4096 Dec  6 18:44 TimeMachine
```

A simple solution in this case is to make the TimeMachine directory globally rw-able.
```sh
# chmod 777 TimeMachine
# ls -l
drwxrwxrwx 2 root    root    4096 Dec  6 18:44 TimeMachine
```



