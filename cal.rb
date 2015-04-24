#!/usr/bin/env ruby

require_relative 'lib/month'
require_relative 'lib/day'

month = ARGV[0]
year = ARGV[1]

Default_error_msg = "Date not in acceptable format/range."

m = Month.new(month, year)
puts m.to_s

