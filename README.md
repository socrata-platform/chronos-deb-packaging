# Chronos Debian Packaging

## Usage

Check lastest release at [Chronos page](https://github.com/mesos/chronos/releases). Chronos could be easily run on Marathon (3rd option).

```
$ ./build_chronos --version 2.2.0
```
optionally you can specify patch version
```
$ ./build_chronos --version 2.2.0 --patch "-p1"
```

create tar archive for running on Marathon:
```
./marathon_chronos --version 2.3.4
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

