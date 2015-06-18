# Mailcatcher

MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface.

#### With docker compose
```
docker-compose build
docker-compose up -d
```
#### Without docker compose
```
docker run -d -p 1025:1025 -p 1080:1080 nlemahieu/mailcatcher
```

- Go to your favorite broswer and go to http://localhost:1080, you'll see the web interface of mailcatcher.
- To configure your project with mailcatcher, define your host with the address localhost:1025
