require_relative 'helper'

class TestCheersIntegration < MiniTest::Test

  def test_that_test_suite_is_working
    output = false
    expected = false
    assert_equal expected, output
  end

  def test_valid_month_year
    output = `./cal.rb 10 2015`
    expected = <<EOS
    October 2015
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29 30 31

EOS
    assert_equal expected, output
  end

  def test_twenty_eight_day_Feb
    output = `./cal.rb 02 2015`
    expected = <<EOS
   February 2015
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28


EOS
    assert_equal expected, output
  end

  def test_twenty_nine_day_Feb
    output = `./cal.rb 02 2016`
    expected = <<EOS
   February 2016
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29

EOS
    assert_equal expected, output
  end




end