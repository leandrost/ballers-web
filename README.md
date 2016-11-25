![Ballers](media/logo.png)

A basketball social network. Find basketball games near to you.
#
[![Build Status](https://semaphoreci.com/api/v1/leandrost/ballers-web/branches/master/shields_badge.svg)](https://semaphoreci.com/leandrost/ballers-web)

### Prerequisites
* `Git`
* `Ruby 2.3.x`
* `Nodejs 6.9.x LTS`
* `Mongo DB 3.2.x`
* [`Bundler 1.12.x`](http://bundler.io/)
* [`Yarn`](https://yarnpkg.com/)

### Getting Started
1. Clone this repo:
  ```
  git clone git@github.com:leandrost/ballers-web.git
  ```
2. Install Ruby dependencies:
  ```
  bundle install
  ```
3. Install JavaScript dependencies:
  ```
  yarn install
  ```

### Running
```
source .env
bundle exec foreman start -f Procfile.development
```

### Test
```
bundle exec rspec
```

### Deploy
```
git push heroku master
```

### License

Copyright (c) 2016 Leandro Thimóteo<br/>
Licensed under the MIT license.
