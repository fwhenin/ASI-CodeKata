input = File.open('../football.dat', File::RDONLY){|f| f.read }
teams = input.lines.map(&:split)
teams.shift

def is_integer(string)
  return /\A\d+\z/.match(string)
end

finalTeam = ""
finalDifference = nil

for team in teams
  teamName = team[1]
  forGoals = team[6]
  againstGoals = team[8]

  if !is_integer(forGoals) || !is_integer(againstGoals)
    next
  end


  diff = forGoals.to_i - againstGoals.to_i
  diff = diff.abs

  if finalDifference == nil || diff < finalDifference
    finalTeam = teamName
    finalDifference = diff
  end

end

puts finalTeam
