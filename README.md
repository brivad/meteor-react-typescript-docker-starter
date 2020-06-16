bootstrap a project

```
npx degit https://github.com/brivad/meteor-react-typescript-docker-starter.git my-app
```

updates local node_modules, mounted within dev container (in Linux)

`docker-compose run app npm install`

run container commands...

`docker-compose run app meteor update`

`docker-compose run app meteor npm outdated`

`docker-compose run app meteor npm up`
