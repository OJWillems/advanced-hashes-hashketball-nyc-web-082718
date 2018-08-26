require "pry"
<<<<<<< HEAD

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.collect do |home_away, team_data|
    if team_data[:players].keys.include?(name)
      return team_data[:players][name][:points]
    end
  end
end

def shoe_size(name)
  game_hash.collect do |home_away, team_data|
    if team_data[:players].keys.include?(name)
      return team_data[:players][name][:shoe]
    end
  end
end

def team_colors(team_name)
  game_hash.collect do |home_away, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  team_names_array = []
  game_hash.each do |home_away, team_data|
    team_names_array.push(team_data[:team_name])
  end
  team_names_array
end  

def player_numbers(team_name)
  nets_numbers_array = []
  hornets_numbers_array = []
  game_hash.each do |home_away, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data[:players].each do |player_name, player_data|
        nets_numbers_array.push(team_data[:players][player_name][:number])
      end
    elsif team_data[:team_name] == "Charlotte Hornets"
      team_data[:players].each do |player_name, player_data|
        hornets_numbers_array.push(team_data[:players][player_name][:number])
      end
    end
  end
  if team_name == "Brooklyn Nets"
    return nets_numbers_array
  elsif team_name == "Charlotte Hornets"
    return hornets_numbers_array
  end
end

def player_stats(player_name)
  game_hash.each do |home_away, team_data|
    if team_data[:players].keys.include?(player_name)
      return team_data[:players][player_name]
    end
  end
end

def big_shoe_rebounds
  biggest_shoe_size = nil
  biggest_shoe_player_data = nil
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if biggest_shoe_size == nil
        biggest_shoe_size = player_data[:shoe]
        biggest_shoe_player_data = player_data
      elsif biggest_shoe_size < player_data[:shoe]
        biggest_shoe_size = player_data[:shoe]
        biggest_shoe_player_data = player_data
      end
    end
  end
  return biggest_shoe_player_data[:rebounds]
end

def most_points_scored
  player_points_name = nil
  player_points = nil
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_points == nil
        player_points_name = player_name
        player_points = player_data[:points]
      elsif player_points < player_data[:points]
        player_points_name = player_name
        player_points = player_data[:points]
      end
    end
  end
  return player_points_name
end

def winning_team
  nets_points = 0
  hornets_points = 0
  game_hash.each do |home_away, team_data|
    if home_away == :home
      team_data[:players].each do |player_name, player_data|
        nets_points += player_data[:points]
      end
    elsif home_away == :away
      team_data[:players].each do |player_name, player_data|
        hornets_points += player_data[:points]
      end
    end
  end
  if nets_points > hornets_points
    return "Brooklyn Nets"
  elsif hornets_points > nets_points
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  player_name_length = nil
  players_name = nil
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name_length == nil
        player_name_length = player_name.length
        players_name = player_name
      elsif player_name_length < player_name.length
        player_name_length = player_name.length
        players_name = player_name
      end
    end
  end
  return players_name
end

def long_name_steals_a_ton?
  player_name_length = nil
  players_name = nil
  players_steals = nil
  players_steals_name = nil
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name_length == nil
        player_name_length = player_name.length
        players_name = player_name
      elsif player_name_length < player_name.length
        player_name_length = player_name.length
        players_name = player_name
      end
    end
  end
  game_hash.each do |home_away, team_data|
    team_data[:players].each do |player_name, player_data|
      if players_steals == nil
        players_steals = player_data[:steals]
        players_steals_name = player_name
      elsif players_steals < player_data[:steals]
        players_steals = player_data[:steals]
        players_steals_name = player_name
      end
    end
  end
  if players_name == players_steals_name
    return true
  end
=======

def game_hash
  teams = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  name.collect do |
>>>>>>> 5baea1f41f67ccd3ecff8e4d8609d2115f003020
end