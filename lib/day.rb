class Day
attr_reader :month, :year, :day


  def initialize(month, year)
    @month = month
    @year = year
    @day = 1
  end

  def day_of_week
    day_of_month = 1
    day_of_the_week = (day_of_month + (((month + 1) * 26)/10) + year + (year/4) + (6*((year/100))) + (year/400)) % 7
    day_of_the_week

  end

end