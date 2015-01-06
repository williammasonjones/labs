# write a hash table w/ entries from a to z. Use strings as keys tonight.
# do all lower case
# Ex) a is the key and value is alpha
# For each letter check if alphabetical and if it is lower case

require 'pry'


alphabet = {"a" => "alfa", "b" => "bravo", "c" => "charlie", "d" => "delta", "e" => "echo", "f" => "foxtrot", "g" => "golf", "h" => "hotel", "i" =>
"india", "j" => "juliett", "k" => "kilo", "l" => "lima", "m" => "mike", "n" => "november", "o" => "oscar", "p" => "papa", "q" => "quebec", "r" =>
"romeo", "s" => "sierra", "t" => "tango", "u" => "uniform", "v" => "victor", "w" => "whiskey", "x" => "xray", "y" => "yankee", "z" => "zulu" }

# nato = alphabet.invert

# def encoder(msg, alphabet)
#   msg.downcase!
#   msg.chars.each do |c|
#     puts alphabet [c]
#   end
# end
#
# encoder("test", alphabet)

def decoder(msg, alphabet)
  msg.downcase!
  msg.split.each do |c|
    puts alphabet.invert[c]
  end
# binding.pry

end

decoder("tango echo sierra tango", alphabet)
# binding.pry
