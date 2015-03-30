require 'yaml'
#require 'hashie'

eyeshadows = begin
  YAML.load(File.open("list.yaml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

# read list and create array
def read_lines_to_array(file_path, array)
  f = File.open("#{file_path}", "r")
  f.each_line do |line|
    array.push(line.chop!)
  end
  f.close
end

# choose one eyeshadows
def choose_one(array, neutral)
  one = rand(array.length)
  puts "choose one   " +array[one]['name']
  if (neutral)
    if(!array[one]['neutral'])
      choose_one(array, neutral)
    else
      array[one]
    end
  else
    array[one]
  end
end

# choose two different eyeshadows
def choose_two(array, neutral)
  puts "choose two"
  one=choose_one(array, neutral)
  two=choose_one(array, neutral)
  if (two['lightness']!=1 || one['lightness']!=5)
    while (one['lightness']>two['lightness'])
      one=choose_one(array, neutral)
    end
  else
    choose_two(array, neutral)
  end
  x = ["Other-V", "Liner"]
  puts "Lid: "+one['name'].to_s + "\n" + x[rand(x.length)]+": "+two['name'].to_s
end

# choose three different eyeshadows
# def choose_three(array)
#   one=0
#   two=0
#   three=0
#   while (one == two || one == three || two == three)
#     one = rand(array.length)
#     two = rand(array.length)
#     three = rand(array.length)
#   end
#   puts array[one].to_s + " + " + array[two].to_s + " + " + array[three].to_s
# end

#read_lines_to_array("list.txt", eyeshadows)
choose_two(eyeshadows, false)
