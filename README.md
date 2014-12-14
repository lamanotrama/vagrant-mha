# Vagrant MHA

## Overview

MHA([mysql-master-ha](https://code.google.com/p/mysql-master-ha/))を試せる環境をVagrantでお手軽に用意できるやつ。

![overview](https://cloud.githubusercontent.com/assets/329120/5428286/a0ef9646-8400-11e4-9ddb-29824302ea58.png)

## Setup

```
bundle install --path vendor/bundle
bundle exec librarian-puppet install --path vendor/modules
vagrant up
```

## Demo

```
cp misc/mha-demo.yml ~/.tmuxinator/
bundle exec mux mha-demo
```

![demo](https://cloud.githubusercontent.com/assets/329120/4963945/e8a0eab2-6736-11e4-8823-1616f8033ff7.gif)

## See also

[lamanotrama/puppet-mha](https://github.com/lamanotrama/puppet-mha)
