require_relative '../lib/day'
require_relative '../lib/year'

class Month
  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def name
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @name = month_names[@month - 1]
    @name
  end

  def get_first_day_of_month
    Day.new(month, year).day_of_the_week
  end

  def count_days_in_month
    y = Year.new(@year)
    if [4, 6, 9, 11].include?(month)
      return 30
    elsif month == 2 && y.is_leap_year?
      return 29
    elsif month == 2 && y.is_leap_year?.nil?
      return 28
    else
      return 31
    end
  end

  def create_days_string
    m_length = count_days_in_month
    days_string = ""

    (1..m_length).each do |day_num|
      if day_num ==1
        days_string << "#{day_num}"
      elsif day_num.to_s.length == 1
        days_string << "  #{day_num}"
      else
        days_string << " #{day_num}"
      end
    end

    days_string
  end

  def format_days_string
    days_string = create_days_string()
    first_day = get_first_day_of_month()
    days_string.prepend(" " * ((first_day * 3) -2) )
    new_string = ""
    6.times do |x|
      if x < 5
        new_string << days_string.slice!(0, 21).rstrip << "\n"
      else
        new_string << days_string.slice!(0, 21)
      end
    end
    new_string
  end

  def to_s
    days_string = format_days_string()
    weekday_header = "Su Mo Tu We Th Fr Sa"
    month_year_header = "#{name} #{year}".center(20).rstrip

  <<EOS
#{month_year_header}
#{weekday_header}
#{days_string}
EOS
  end

end