# Etikette
[![Build Status](https://travis-ci.org/nogdacosta/etikette.svg?branch=master)](https://travis-ci.org/nogdacosta/etikette) [![Dependency Status](https://gemnasium.com/badges/github.com/nogdacosta/etikette.svg)](https://gemnasium.com/github.com/nogdacosta/etikette) [![Code Climate](https://codeclimate.com/github/nogdacosta/etikette/badges/gpa.svg)](https://codeclimate.com/github/nogdacosta/etikette)

A project born from the need of


## Installation

### Dependencies
To run Etikette we need the following prerequisites:

* [Homebrew](http://brew.sh/) (for downloading software packages)

```
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

* [Git](http://git-scm.com/) (version control)

```
$ brew install git
```

* RVM, ruby 2.3.0

```
$ \curl -L https://get.rvm.io | bash -s stable --ruby=2.3.0
$ rvm use 2.3.0 --default
```

We also require rails 5 gem `rails ( >= 5.0.0.beta3, < 5.1 )`

* [Postgres](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup) (database)

* [ImageMagick](http://www.imagemagick.org/script/index.php) (image processing software)

```
$ brew install imagemagick
```

### Local Setup

Clone Etikette :bookmark:

```bash
$ git clone git://github.com/nogdacosta/etikette.git
$ cd etikette
```
Run
```bash
$ bundle install
```

Create / migrate database
```bash
$ rake db:create
$ rake db:migrate
```

Run the Rails server
```bash
$ rails s
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

To learn a bit more why I've started this project you can read [this post](https://medium.com/@nogdacosta/a063d4cd04a8) on Medium

## Credits

TODO: Write credits

## License

Copyright &copy; 2016 @nogdacosta - Released under the MIT license.
