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
    return game[0]
  else 
    return game[1]
  end
end



def rps_tournament_winner(game)
  if game.length == 1 or game[0].kind_of?(Array) == false
    return game
  else
    if game[0][0].kind_of?(Array)
      g1 = rps_tournament_winner(game[0])
      g2 = rps_tournament_winner(game[1])
      newgame = [g1,g2]
      return rps_tournament_winner(newgame)
   else
     return rps_game_winner(game)
   end
  end
end

my_game = [ [ [ ["Armando","P"],["Dave","S"] ], [ [ "Richard", "R"], ["Michael","S"] ], ], [ [ [ "Allen","S"], ["Omer","P"] ], [ [ "David E.", "R"], [ "Richard X.","P" ] ] ] ]
my_game3 = ["Fer","P"]
my_game2 = [ [ [ [ "Allen","S"], ["Omer","P"] ], [ [ "David E.", "R"], [ "Richard X.","P" ] ] ] , [ [ ["Armando","P"],["Dave","S"] ], [ [ "Richard", "R"], ["Michael","S"] ] ]]
win = rps_tournament_winner(my_game2)
p win
