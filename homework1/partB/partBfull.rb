class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner2(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  rules = Hash.new
  rules["R"] = ["R","S"]
  rules["S"] = ["S","P"]
  rules["P"] = ["P","R"]
  raise NoSuchStrategyError unless rules.has_key?(game[0][1])
  raise NoSuchStrategyError unless rules.has_key?(game[1][1])
  if rules[game[0][1]].include? (game[1][1])
    return game[0]
  else 
    return game[1]
  end
end

#wrapper
def rps_game_winner(game)
  p rps_game_winner2(game)
end

def rps_tournament_winner2(game)
  if game.length == 1 or game[0].kind_of?(Array) == false
    return game
  else
    if game[0][0].kind_of?(Array)
      g1 = rps_tournament_winner2(game[0])
      g2 = rps_tournament_winner2(game[1])
      newgame = [g1,g2]
      return rps_tournament_winner2(newgame)
   else
     return rps_game_winner2(game)
   end
  end
end

#wrapper
def rps_tournament_winner(game)
  p rps_tournament_winner2(game)
end

