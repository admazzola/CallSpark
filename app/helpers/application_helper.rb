module ApplicationHelper



  def color (index)
    case index
     when 1
       return '#cf4c64'
     when 2
       return '#9f1c34'
     when 3
        return '#E0E4CC'
     when 4
        return '#F38630'
     else
        return '#F38630'
     end
  end


  def cssClassActive (contName)



    if( controller_name == contName)
       return "class=active"
     end
      return ''
  end


  def format_standard_date(date,as_words)

     datetime_format = "%m/%d/%Y"

     if as_words
       datetime_format = "%B %d, %Y"
    end

    if date

      if date.instance_of? String

        begin
        date = Date.parse(date)

        rescue ArgumentError
          return  ''
        end

        return date

      else

        return date.strftime(datetime_format)

      end

          return Time.current.strftime(datetime_format)

    end


    return ''
  end

  def format_standard_datetime(date, as_words )
    if as_words
        return date.strftime("%B %d, %Y at %l:%M%p")
    else
       return date.strftime("%m/%d/%Y at %l:%M%p")
    end
  end


  def in_words(int)
  numbers_to_name = {
      1000000 => "million",
      1000 => "thousand",
      100 => "hundred",
      90 => "ninety",
      80 => "eighty",
      70 => "seventy",
      60 => "sixty",
      50 => "fifty",
      40 => "forty",
      30 => "thirty",
      20 => "twenty",
      19=>"nineteen",
      18=>"eighteen",
      17=>"seventeen",
      16=>"sixteen",
      15=>"fifteen",
      14=>"fourteen",
      13=>"thirteen",
      12=>"twelve",
      11 => "eleven",
      10 => "ten",
      9 => "nine",
      8 => "eight",
      7 => "seven",
      6 => "six",
      5 => "five",
      4 => "four",
      3 => "three",
      2 => "two",
      1 => "one"
    }
  str = ""
  numbers_to_name.each do |num, name|
    if int == 0
      return "zero"
    elsif int.to_s.length == 1 && int/num > 0
      return str + "#{name}"
    elsif int < 100 && int/num > 0
      return str + "#{name}" if int%num == 0
      return str + "#{name} " + in_words(int%num)
    elsif int/num > 0
      return str + in_words(int/num) + " #{name} " + in_words(int%num)
    end
  end
end

end
