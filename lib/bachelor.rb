def get_first_name_of_season_winner(data, season)
  firstname = ""
  data.each do |ssn, info|
    if ssn == season
      info.each do |ary|
        if ary["status"] == "Winner"
          nameary = ary["name"].split(" ")
          firstname = nameary.shift
        end
      end
    end
  end
  firstname
end

def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.each do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, info|
    info.each do |contestant|
      if contestant["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  people = []
  data.each do |season, info|
    info.each do |contestant|
      if contestant["hometown"] == hometown
        people << contestant["occupation"]
      end
    end
  end
  people.shift
end

def get_average_age_for_season(data, season)
  ages = []
  data.each do |ssn, info|
    if ssn == season
      info.each do |contestant|
        ages << contestant["age"].to_i
      end
    end
  end
  avg = ages.inject(:+) / ages.length.to_f
  avg.round
end
