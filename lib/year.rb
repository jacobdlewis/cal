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

  def create_header
    month_names = []
    (1..12).each do |x|
      m = Month.new(x, @year)
      month_names.push(m.name)
    end
    month_names
  end

  def create_month_array
    year = @year
    months = []
    (1..12).each do |x|
      m = Month.new(x, year)
      months.push(m.to_s.split("\n"))
    end

    months.map do |x|
      x.shift
    end
    months

  end

  def to_s
    year = @year
    months = create_month_array
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    year_header = "#{year}".rjust(33) + "\n" + "\n"
    str_printout = "#{year_header}"

    months.each_slice(3) do |row|
    month_row = "#{month_names.shift.center(20)}  #{month_names.shift.center(20)}  #{month_names.shift.center(20)}"

      row[0][6] = "                    " if row[0][6].nil?
      row[1][6] = "                    " if row[1][6].nil?
      row[0][5] = "                    " if row[0][5].nil?
      row[1][5] = "                    " if row[1][5].nil?
      row[2][5] = "                    " if row[2][5].nil?
      str_printout << <<EOS
#{month_row.rstrip}
#{row[0][0]}  #{row[1][0]}  #{row[2][0]}
#{row[0][1]}  #{row[1][1]}  #{row[2][1]}
#{row[0][2]}  #{row[1][2]}  #{row[2][2]}
#{row[0][3]}  #{row[1][3]}  #{row[2][3].rstrip}
#{row[0][4]}  #{row[1][4]}  #{row[2][4].rstrip}
#{row[0][5].ljust(20)}  #{row[1][5].ljust(20)}  #{row[2][5].ljust(20).rstrip}
#{row[0][6].ljust(20)}  #{row[1][6].ljust(20)}  #{row[2][6]}
EOS
    end
  str_printout
  end

end


