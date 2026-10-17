#!/usr/bin/env ruby
require_relative 'lib/calculator/cli'

cli = Calculator::CLI.new
exit(cli.run(ARGV))
