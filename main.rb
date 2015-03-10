eyeshadows = []

# read list and create array
def read_lines_to_array(file_path, array)
  f = File.open("#{file_path}", "r")
  f.each_line do |line|
    array.push(line.chop!)
  end
  f.close
end

# choose one eyeshadows
def choose_one(array)
  one = rand(array.length)
  puts array[one].to_s
end

# choose two different eyeshadows
def choose_two(array)
  one=0
  two=0
  while (one == two)
    one = rand(array.length)
    two = rand(array.length)
  end
  puts array[one].to_s + " + " + array[two].to_s
end

# choose three different eyeshadows
def choose_three(array)
  one=0
  two=0
  three=0
  while (one == two || one == three || two == three)
    one = rand(array.length)
    two = rand(array.length)
    three = rand(array.length)
  end
  puts array[one].to_s + " + " + array[two].to_s + " + " + array[three].to_s
end

read_lines_to_array("list.txt", eyeshadows)
choose_two(eyeshadows)
