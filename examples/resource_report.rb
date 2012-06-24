#!/usr/bin/env ruby
require 'puppet'
catalog = Puppet::Resource::Catalog.convert_from(:pson, File.read("/tmp/catalog.json"))
catalog.resources.reject { |r| %w{Class Stage}.include?(r.type) }.each { |r| puts r }
