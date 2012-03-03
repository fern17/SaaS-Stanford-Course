class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  rules = Hash.new
  rules["R"] = ["R","S"]
  rules["S"] = ["S","P"]
  rules["P"] = ["P","R"]
  raise NoSuchStrategyError unless rules.has_key?(game[0][1])
  raise NoSuchStrategyError unless rules.has_key?(game[1][1])
  if rules[game[0][1]].include? (game[1][1])
    print game[0]
  else 
    print game[1]
  end
end


rps_game_winner([ [ "Armando", "P"], ["Dave", "X"] ])
rps_game_winner([ [ "Armando", "P"], ["Dave", "S"] ])
rps_game_winner([ [ "Armando", "P"], ["Dave", "P"] ])
rps_game_winner([ [ "Armando", "P"], ["Dave", "R"] ])
#rps_game_winner([ [ "Armando", "P"], ["Dave", "S"] ])
rps_game_winner([ [ "Armando", "S"], ["Dave", "P"] ])
rps_game_winner([ [ "Armando", "S"], ["Dave", "R"] ])
rps_game_winner([ [ "Armando", "S"], ["Dave", "S"] ])
rps_game_winner([ [ "Armando", "R"], ["Dave", "P"] ])
rps_game_winner([ [ "Armando", "R"], ["Dave", "R"] ])
rps_game_winner([ [ "Armando", "R"], ["Dave", "S"] ])
