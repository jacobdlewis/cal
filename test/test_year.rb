require_relative 'helper'
require_relative '../lib/year'

class TestYear < MiniTest::Test

  def test_year_to_s_2015
    y = Year.new(2015)
    output = `cal 2015`
    assert_equal output, y.to_s
  end

  def test_year_to_s_1900
    y = Year.new(1900)
    output = `cal 1900`
    assert_equal output, y.to_s
  end

  def test_year_to_s_2915
    y = Year.new(2915)
    output = `cal 2915`
    assert_equal output, y.to_s
  end

  def test_year_to_s_2000
    y = Year.new(2000)
    output = `cal 2000`
    assert_equal output, y.to_s
  end

  def test_year_to_s_1800
    y = Year.new(1800)
    output = `cal 1800`
    assert_equal output, y.to_s
  end

  def test_year_to_s_3000
    y = Year.new(3000)
    output = `cal 3000`
    assert_equal output, y.to_s
  end

  def test_is_2000_leap_year
    y = Year.new(2000)
    expected = true
    assert_equal expected, y.is_leap_year?
  end

  def test_is_1800_leap_year
    y = Year.new(1800)
    expected = false
    assert_equal expected, y.is_leap_year?
  end

  def test_is_2016_leap_year
    y = Year.new(2016)
    expected = true
    assert_equal expected, y.is_leap_year?
  end

  def test_is_1997_leap_year
    y = Year.new(1997)
    expected = false
    assert_equal expected, y.is_leap_year?
  end

end


