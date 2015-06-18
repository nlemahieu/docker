Apache
==
![Apache](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/ASF-logo.svg/langfr-96px-ASF-logo.svg.png) 

The Apache HTTP Server, colloquially called Apache), is the world's most widely used web server software.

```
docker run -d -p 80:80 -p 8080:8080 -v /var/www:/var/www  --net="host" nlemahieu/apache:latest

```