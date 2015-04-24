#!/usr/bin/env ruby

require_relative 'lib/month'
require_relative 'lib/day'

month = ARGV[0].to_i
year = ARGV[1].to_i

Default_error_msg = "Date not in acceptable format/range."

if month == 0 || month > 12
  print Default_error_msg
elsif year < 1800 || year > 3000
  print Default_error_msg
else
  m = Month.new(month, year)
  puts m.to_s
end

