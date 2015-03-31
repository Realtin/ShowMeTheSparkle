#!/usr/bin/env ruby

require 'yaml'

eyeshadows = begin
  YAML.load(File.open("list.yaml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

# choose one eyeshadows
def choose_one(array, neutral)
  one = rand(array.length)
  #puts "choose one   " +array[one]['name']
  if neutral
    if array[one]['neutral']
      array[one]
    else
      choose_one(array, neutral)
    end
  else
    array[one]
  end
end

# choose two different eyeshadows
def choose_two(array, neutral)
  #puts "choose two"
  one=choose_one(array, neutral)
  two=choose_one(array, neutral)
  if two['lightness']!=1 || one['lightness']!=5
    while one['lightness']>=two['lightness']
      one=choose_one(array, neutral)
    end
  else
    choose_two(array, neutral)
  end
  x = ["Other-V", "Liner"]
  puts "Lid: "+one['name'].to_s + "\n" + x[rand(x.length)]+": "+two['name'].to_s
end

def find_same_color(color, array)
  one=choose_one(array, false)
  if one['cw'].eql? color
    one
  else
    find_same_color(color, array)
  end
end

# choose three different eyeshadows
def choose_three(array)
  one=choose_one(array, false)
  #Monochromatic
  color = one['cw']
  two=find_same_color(color, array)
  puts color
  three = find_same_color(color, array)
  puts one['name'] + ", " + two['name']+ ", "+three['name']
end

choose_three(eyeshadows)
