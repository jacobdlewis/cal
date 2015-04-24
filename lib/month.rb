require_relative '../lib/day'

class Month
  attr_reader :month, :year, :name


  def initialize(month, year)
    @month = month
    @year = year
    @name
  end

  def name
    month_names = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @name = month_names[@month]
    @name
  end

  def get_first_day_of_month
    Day.new(month, year).day_of_the_week
  end

  def to_s
    m_length = count_days_in_month
    first_day = get_first_day_of_month
    print_out = ""
    weekday_header = "Su Mo Tu We Th Fr Sa"
    month_year_header = "#{name} #{year}".center(20).rstrip

    #generate unformatted list of dates
    (1..m_length).each do |x|
      if x ==1
        print_out << "#{x}"
      elsif x.to_s.length == 1
        print_out << "  #{x}"
      else
        print_out << " #{x}"
      end
    end

    #Add the appropriate number of leading
    #spaces to the first day of the month
    print_out.prepend(" " * ((first_day * 3) -2) )

    line_1 = print_out.slice!(0, 21).rstrip
    line_2 = print_out.slice!(0, 21).rstrip
    line_3 = print_out.slice!(0, 21).rstrip
    line_4 = print_out.slice!(0, 21).rstrip
    line_5 = print_out.slice!(0, 21).rstrip
    line_6 = print_out.slice!(0, 21)

  <<EOS
#{month_year_header}
#{weekday_header}
#{line_1}
#{line_2}
#{line_3}
#{line_4}
#{line_5}
#{line_6}
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