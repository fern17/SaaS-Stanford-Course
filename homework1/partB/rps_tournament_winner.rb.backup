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
  game.flatten!
  winners = Array.new
  begin 
    game.each_slice(4) do |p1,g1,p2,g2|
      play = [[p1,g1],[p2,g2]]
      #p play
      winners << rps_game_winner( play )
      winners.flatten!(1)
    end
    game = winners
  end while winners.length > 2
  puts game[0]
end

my_game = [ [ [ ["Armando","P"],["Dave","S"] ], [ [ "Richard", "R"], ["Michael","S"] ], ], [ [ [ "Allen","S"], ["Omer","P"] ], [ [ "David E.", "R"], [ "Richard X.","P" ] ] ] ]

my_game2 = [ [ [ [ "Allen","S"], ["Omer","P"] ], [ [ "David E.", "R"], [ "Richard X.","P" ] ] ] , [ [ ["Armando","P"],["Dave","S"] ], [ [ "Richard", "R"], ["Michael","S"] ] ]]
rps_tournament_winner(my_game2)
