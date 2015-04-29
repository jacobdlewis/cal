require_relative 'helper'
require_relative '../lib/month'
class TestMonth < MiniTest::Test

  def test_initializing_month_saves_values
    m = Month.new(05, 2015)
    assert_equal 05, m.month
    assert_equal 2015, m.year
  end

  def test_to_s_on_jan_1_2012
    m = Month.new(1, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_mar_2009
    m = Month.new(03, 2009)
    expected = <<EOS
     March 2009
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_to_s_on_july_2007
    m = Month.new(07, 2007)
    expected = <<EOS
     July 2007
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
    assert_equal expected, m.to_s
  end

  def test_name_march
    m = Month.new(03, 2009)
    expected = "  March"
    assert_equal expected, m.name
  end

  def test_name_march
    m = Month.new(05, 2008)
    expected = "May"
    assert_equal expected, m.name
  end

  def test_name_january
    m = Month.new(1, 2001)
    expected = "January"
    assert_equal expected, m.name
  end

  def test_name_december
    m = Month.new(12, 1801)
    expected = "December"
    assert_equal expected, m.name
  end


  def test_days_in_April
    m = Month.new(4, 2015)
    expected = 30
    assert_equal expected, m.count_days_in_month
  end

  def test_days_in_Feb_base
    m = Month.new(2, 1800)
    expected = 28
    assert_equal expected, m.count_days_in_month
  end

  def test_days_in_Feb_leap
    m = Month.new(2, 2016)
    expected = 29
    assert_equal expected, m.count_days_in_month
  end

  def test_days_in_Oct
    m = Month.new(10, 2015)
    expected = 31
    assert_equal expected, m.count_days_in_month
  end

  def test_get_first_day_in_month_April
    m = Month.new(4, 2015)
    expected = 4
    assert_equal expected, m.get_first_day_of_month
  end

end