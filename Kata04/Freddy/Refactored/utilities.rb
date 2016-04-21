class Utilities
  def self.getDataFromFile(filename)
    input = File.open(filename, File::RDONLY){|f| f.read }
    data = input.lines.map(&:split)
    data.shift
    return data
  end

  def self.isInteger(string)
    return /\A\d+\z/.match(string)
  end

  def self.isNullOrEmpty(string)
    return string.to_s.empty?
  end

  def self.cleanUpInteger(string)
    return string.gsub(/[^0-9]/, '').to_i
  end
end
