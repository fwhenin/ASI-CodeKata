input = File.open('../weather.dat', File::RDONLY){|f| f.read }
daysData = input.lines.map(&:split)

finalDayValue = 0
finalDifference = nil
# Determine day with smallest difference between min and max

for dayData in daysData
    day = dayData[0]


    if day.to_i == 0
      next
    end

    max = dayData[1]
    min = dayData[2]
    if min == nil || max == nil
      next
    end

    max = max.gsub '*', ''
    min = min.gsub '*', ''
    diff = max.to_i - min.to_i;

    if finalDifference == nil || diff < finalDifference
      finalDifference = diff
      finalDayValue = day
    end
end

puts finalDayValue
