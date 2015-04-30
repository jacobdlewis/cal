require_relative '../lib/month'

class Year

  def initialize(year)
    @year = year
  end

  def is_leap_year?
    year = @year
    if year % 100 == 0 && year % 400 != 0
      return nil
    elsif year % 100 == 0 && year % 400 == 0
      return true
    elsif year % 4 == 0
      return true
    else
      return nil
    end
  end

  def create_month_array
    year = @year
    months = []
    (1..12).each do |x|
      m = Month.new(x, year)
      month_arr = m.to_s.split("\n")
      month_arr.shift
      months.push(month_arr)
    end
    months
  end

  def equalize_line_lengths
    months = create_month_array
    counter = 1
    months.each do |month|
      unless counter % 3 == 0
        month[5] = (" " * 20) if month[5].nil?
        month[5] << (" " * (20 - month[5].length)) if month[5].length < 20
        if month[6].nil?
          month[6] = " " * 20
        elsif month[6] && month[6].length < 20
          month[6] << " " * (20 - month[6].length)
        end
      end
      counter += 1
    end
    months
  end

  def to_s
    year = @year
    months = equalize_line_lengths
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    year_header = "#{year}".rjust(33) + "\n" + "\n"
    str_printout = "#{year_header}"

    months.each_slice(3) do |row|
    month_row = "#{month_names.shift.center(20)}  #{month_names.shift.center(20)}  #{month_names.shift.center(20)}"
      str_printout << <<EOS
#{month_row.rstrip}
#{row[0][0]}  #{row[1][0]}  #{row[2][0]}
#{row[0][1]}  #{row[1][1]}  #{row[2][1]}
#{row[0][2]}  #{row[1][2]}  #{row[2][2]}
#{row[0][3]}  #{row[1][3]}  #{row[2][3]}
#{row[0][4]}  #{row[1][4]}  #{row[2][4]}
#{row[0][5]}  #{row[1][5]}  #{row[2][5]}
#{row[0][6]}  #{row[1][6]}  #{row[2][6]}
EOS
    end
  str_printout
  end

end


