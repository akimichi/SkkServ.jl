# -*- coding: utf-8 -*-

require 'rake'
require 'fileutils'
require 'rake/clean'

namespace :redis do

  desc "dockerイメージを作成する"
  task :build do
    sh "docker build -f Dockerfile.redis -t=\"redis-server\" ."
  end

  desc "dockerコンテナを起動する"
  task :run do
    sh "docker run --name redis -d -p 6379:6379 redis-server"

  end
  desc "redisコンテナにログインする"
  task :login do
    sh "docker exec -it redis /bin/bash "
  end
end



