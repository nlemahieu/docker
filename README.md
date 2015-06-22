![Coffeescript](http://coffeescript.org/documentation/images/logo.png)

CoffeeScript is a little language that compiles into JavaScript.

```
docker run -v `pwd`:/pwd -w /pwd nlemahieu/coffeescript coffee [CMD]
```

You can also create a new alias on your machine

```
alias coffee='docker run -v `pwd`:/pwd -w /pwd nlemahieu/coffeescript coffee coffee'
```

Coffeescript documentation: http://coffeescript.org/