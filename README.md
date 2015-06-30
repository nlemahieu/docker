Phantomjs
==

![Phantomjs](http://phantomjs.org/img/phantomjs-logo.png)

PhantomJS is a scripted, headless browser used for automating web page interaction. PhantomJS provides a JavaScript API enabling automated navigation, screenshots, user behavior and assertions making it a common tool used to run browser-based unit tests in a headless system like a continuous integration environment. PhantomJS is based on Webkit making it a similar browsing environment to Safari and Google Chrome (before Chrome's fork of webkit evolved into Blink).

```
docker run -v `pwd`:/project nlemahieu/phantomjs:latest /phantomjs/bin/phantomjs [args]
```

or you can add a new alias on your machine

```
alias phantomjs='docker run -v `pwd`:/project nlemahieu/phantomjs:latest /phantomjs/bin/phantomjs'
```