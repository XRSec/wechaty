## Wechaty Docker & Heroku

```bash
heroku create [app-name]
heroku git:remote -a [app-name]
heroku buildpacks:set https://github.com/heroku/docker.git
git add .
git commit -m "My first commit"
git push heroku main
```

```bash
docker build -t registry.heroku.com/[app-name]/wechaty .
docker push registry.heroku.com/[app-name]/wechaty
heroku container:release -a [app-name] wechaty
```
