class Utilities
  def self.getDataFromFile(filename)
    input = File.open(filename, File::RDONLY){|f| f.read }
    data = input.lines.map(&:split)
    data.shift
    return data
  end

  def self.isInteger(val)
    if val.is_a? Integer
      return true
    end
    return /\A\d+\z/.match(val)
  end

  def self.isNullOrEmpty(string)
    return string.to_s.empty?
  end

  def self.cleanUpInteger(string)
    if isInteger(string)
      return string.to_i
    end
    return string.gsub(/[^0-9]/, '').to_i
  end
end
