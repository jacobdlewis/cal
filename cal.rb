#!/usr/bin/env ruby
month = ARGV[0]
year = ARGV[1]
puts `cal #{month} #{year}`

Default_error_msg = "Date not in acceptable format/range."
