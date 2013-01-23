#!/usr/bin/env macruby

require 'rubygems'
require 'erb'
_root_path = File.expand_path(File.dirname(__FILE__))
$:.unshift(File.join(_root_path, '/app'))
require 'lib/loader'
BoyMonster.start _root_path
BoyMonster.run
