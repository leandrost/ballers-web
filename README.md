# ![Ballers](media/logo.png)

A basketball social network. Find basketball games near to you.

### Prerequisites
* `Git`
* `Ruby 2.3.x`
* `Nodejs 6.9.x LTS`
* `Postgres 9.5.x`
* [`Bundler 1.12.x`](http://bundler.io/)
* [`Yarn`](https://yarnpkg.com/)

### Getting Started
Clone this repo:
```
git clone git@github.com:leandrost/ballers-web.git
```
Install Ruby dependencies:
```
bundle install
```
Install JavaScript dependencies:
```
yarn install
```
Setup Database
```
bundle exec rake db:setup
```

### Running
```
bundle exec foreman start -f Procfile.development
```

### Test
```
bundle exec rspec
```

### Deploy
```
TODO
```

### License

Copyright (c) 2016 Leandro Thimóteo<br/>
Licensed under the MIT license.
