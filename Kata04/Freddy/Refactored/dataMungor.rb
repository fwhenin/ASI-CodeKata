require_relative 'utilities'
class DataMungor
  def self.findMinAndMax(filename, returnValueIdx, maxIdx, minIdx)
    allData = Utilities.getDataFromFile(filename)
    finalValue = 0
    finalDifference = nil
    # Determine day with smallest difference between min and max

    for data in allData
        value = data[returnValueIdx]
        max = data[maxIdx]
        min = data[minIdx]

        if Utilities.isNullOrEmpty(value)
          next
        end


          if !Utilities.isInteger(min) || !Utilities.isInteger(max)
            next
          end

        max = Utilities.cleanUpInteger(max)
        min = Utilities.cleanUpInteger(min)

        diff = max - min;
        diff = diff.abs

        if finalDifference == nil || diff < finalDifference
          finalDifference = diff
          finalValue = value
        end
    end

    return finalValue
  end
end
