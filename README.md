# Getting Started

```
docker run -it --rm --cap-add SYS_ADMIN --device /dev/fuse -e AWSACCESSKEYID=... -e AWSSECRETACCESSKEY=... IMAGE S3_BUCKET
```


### Using as a data container

```
docker run -d --name storage --cap-add SYS_ADMIN --device /dev/fuse -e AWSACCESSKEYID=... -e AWSSECRETACCESSKEY=... IMAGE S3_BUCKET
docker run -d --volumes-from storage nginx
```
