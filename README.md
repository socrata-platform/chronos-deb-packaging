# Chronos Debian Packaging

## Usage

```
$ ./build_chronos --version 2.2.0
```

## Requirements for building package

  * Java
  * Maven
  * Node JS -- js minification
  * FPM (and some version of Ruby) -- for building package

### wheezy

node.js in not included yet
```
apt-get install curl
curl -sL https://deb.nodesource.com/setup | bash -
```

### ubuntu trusty 14.04/jessie

nodejs should be included


```
apt-get install maven nodejs
```

