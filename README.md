![Firefox](https://mozorg.cdn.mozilla.net/media/img/firefox/new/header-firefox.98d0a02c957f.png)

Mozilla Firefox is a free and open-source web browser developed for Windows, OS X, and Linux, with a mobile version for Android, by the Mozilla Foundation and its subsidiary, the Mozilla Corporation.

Before run the container you'll need to edit the Dockerfile and replace [uid] and [gid] by your user id and your group id.

```
docker run -ti --rm --net="host" -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix nlemahieu/firefox
```
