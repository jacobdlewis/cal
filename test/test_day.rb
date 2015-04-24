require_relative 'helper'
require_relative '../lib/day'

class TestDay < MiniTest::Test

  def test_initializing_day_saves_values
    d = Day.new(01, 2015)
    assert_equal 1, d.month
    assert_equal 2015, d.year
  end

  def test_first_day_of_month_Apr_2015
    d = Day.new(04, 2015)
    assert_equal 4, d.day_of_the_week
  end

  def test_first_day_of_month_May_2016
    d = Day.new(5, 2016)
    assert_equal 1, d.day_of_the_week
  end

  def test_first_day_of_month_Sept_1888
    d = Day.new(9, 1888)
    assert_equal 7, d.day_of_the_week
  end

  def test_first_day_of_month_January_2012
    d = Day.new(1, 2012)
    assert_equal 1, d.day_of_the_week
  end

  def test_first_day_of_month_January_2000
    d = Day.new(1, 2000)
    assert_equal 7, d.day_of_the_week
  end

end