Bower
==

![Bower](http://bower.io/img/bower-logo.png)

Bower is a package management system for client-side programming on the World Wide Web. It depends on Node.js and npm. It works with git and GitHub repositories.

```
docker run -ti -v `pwd`:/project nlemahieu/bower bower [CMD]
```

or you can add a new alias on your machine

```
alias bower='docker run -ti -v `pwd`:/project nlemahieu/bower bower'
```

