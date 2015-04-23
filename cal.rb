#!/usr/bin/env ruby

require_relative 'lib/month'

month = ARGV[0]
year = ARGV[1]

Default_error_msg = "Date not in acceptable format/range."

month = Month.new(month, year)
puts m.to_s

