# Vagrant MHA

MHA([mysql-master-ha](https://code.google.com/p/mysql-master-ha/))を試せる環境をVagrantでお手軽に用意できるやつ。

## How To Setup

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


