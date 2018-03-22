# docker-nso

Getting Started with NSO is easy, this project provides a lightweight container wrapper to help you get started automating even faster..

  
# Setup

You will need to download NSO, and any NEDS that you need from [CCO](https://software.cisco.com/download/navigator.html?mdfid=286283532&catid=268439477)
and save to your machine.  

**NOTE:** since docker is being used, you should download the `linux` variety, even if you're on a Mac.

* Clone the repo

```
git clone https://github.com/chapeter/docker-nso
```

* Copy NSO signed bin to nso folder

```
cp ~/Downloads/nso-4.5.3.linux.x86_64.signed.bin nso/
```

* Copy NEDs signed bins to neds folder

```
cp ~/Downloads/ncs-4.5-cisco-iosxr-6.2.10.signed.bin neds/
```

# Running

```
docker-compose up
```

# Accessing NSO

## CLI

```
ssh admin@localhost -p 2024
```

The default credentials are `admin/admin`

## WebUI

http://localhost:8080/
