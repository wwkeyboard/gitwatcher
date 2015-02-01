class Environment
  PROJECT_BASE = File.dirname(__FILE__)
  CODE_HOME = File.read(File.dirname(__FILE__) + '/codehome').strip
end

require 'rubygems'
require 'sinatra'
require 'grit'
require 'coderay'
require "#{Environment::PROJECT_BASE}/models/repo"
