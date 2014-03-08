#!/usr/bin/env ruby
path = './test/data/words-6b898d7c48630be05b72b3ae07c5be6617f90d8e'
output = File.open('./dict', 'a')
count = 1
IO.foreach(path) do |line|
  line.gsub(/[^ \n]+/) do |word|
    output.write('\'' + word + '\'=>nil,')
  end
  if count == 58000
    output.puts(' ')
  end
  if count == 116000
    output.puts(' ')
  end
  if count == 174000
    output.puts(' ')
  end
  count += 1
end
