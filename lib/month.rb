class Month
  attr_reader :month, :year, :name


  def initialize(month, year)
    @month = month
    @year = year
    @name
  end

  def name
    month_names = ["", " January", "February", "  March", "  April", "   May", "  June", "  July", " August", "September", " October", "November", "December"]
    @name = month_names[@month]
    @name
  end

  def to_s
    <<EOS
   #{name} #{year}
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31

EOS
  end

  def is_leap_year?
    if year % 100 == 0 && year % 400 != 0
      return false
    elsif year % 100 == 0 && year % 400 == 0
      return true
    elsif year % 4 == 0
      return true
    else
      return false
    end
  end

  def count_days_in_month
    if [4, 6, 9, 11].include?(month)
      return 30
    elsif month == 2 && self.is_leap_year?
      return 29
    elsif month == 2 && self.is_leap_year? == false
      return 28
    else
      return 31
    end
  end



end