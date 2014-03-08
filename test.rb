#!/usr/bin/env ruby
path = ARGV.length > 0 ? ARGV[0] : '/usr/share/dict/words'
$dict = File.read(path).split("\n")

def check(word, left, right)
  go = true
  output = false
  while go

    mid_index = (right - left) / 2 + left
    mid_word = $dict[mid_index]

    puts word + ', ' + left.to_s + ', ' + mid_index.to_s + ', ' + right.to_s + ', ' + mid_word
    if (right - left) == 0

      if word == mid_word
        output = true
        go = false
      else
        output = false
        go = false
      end

    elsif (right - left) == 1

      if word == mid_word || word == $dict[mid_index + 1]
        output = true
        go = false
      else
        output = false
        go = false
      end

    else

      if word == mid_word
        output = true
        go = false
      elsif (word.downcase < $dict[mid_index].downcase)
        right = mid_index - 1
      else
        left = mid_index + 1
      end

    end

  end

  return output

end

check('Clement', 0, 234936)
