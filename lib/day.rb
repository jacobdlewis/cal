class Day
attr_reader :month, :year


  def initialize(month, year)
    @month = month
    @year = year
  end

  def day_of_the_week

    day_of_month = 1

    if month == 1 || month == 2
      @month += 12
      @year -= 1
    end

    ####################################################
    # This is Zeller's Congruence. It calculates       #
    # the day of the week for a specified date.        #
    # In this implementation, Zeller's is always       #
    # looking for the first day of the month.          #
    # The function returns 1-7, corresponding to Su-Sa #
    # http://en.wikipedia.org/wiki/Zeller's_congruence #
    ####################################################

    day_of_week = (day_of_month + ((26 * (@month + 1))/10) + @year + (@year/4) + 6 * (@year/100) + (@year/400)) % 7
    if day_of_week == 0
      return 7
    else
      return day_of_week
    end

  end

end