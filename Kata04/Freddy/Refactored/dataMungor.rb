require_relative 'utilities'
class DataMungor
  def self.findMinAndMax(filename, returnValueIdx, maxIdx, minIdx)
    dataRows = Utilities.getDataFromFile(filename)

    # used to keep track of current difference to compare against
    finalValue = 0
    finalDifference = nil

    for dataRow in dataRows
        displayValue = dataRow[returnValueIdx]
        max = dataRow[maxIdx]
        min = dataRow[minIdx]

        # if the displayValue is null or empty, there's nothing to show
        if Utilities.isNullOrEmpty(displayValue)
          next
        end

        # make sure they're cleaned up a bit (i.e. remove the * from the weather.dat)
        max = Utilities.cleanUpInteger(max)
        min = Utilities.cleanUpInteger(min)

        # if either of the min and max aren't integers, NEXT
        if !Utilities.isInteger(min) || !Utilities.isInteger(max)
          next
        end

        diff = max - min;
        diff = diff.abs

        # checking against previous loop, or if it's the first time then
        # apply it to the holder variables
        if finalDifference == nil || diff < finalDifference
          finalDifference = diff
          finalValue = displayValue
        end
    end

    return finalValue
  end
end
