
require 'pry'

alphabet = {"a" => "alfa", "b" => "bravo", "c" => "charlie", "d" => "delta", "e" => "echo", "f" => "foxtrot", "g" => "golf", "h" => "hotel", "i" =>
  "india", "j" => "juliett", "k" => "kilo", "l" => "lima", "m" => "mike", "n" => "november", "o" => "oscar", "p" => "papa", "q" => "quebec", "r" =>
  "romeo", "s" => "sierra", "t" => "tango", "u" => "uniform", "v" => "victor", "w" => "whiskey", "x" => "xray", "y" => "yankee", "z" => "zulu" }


def encoder(msg, alphabet)
  msg.downcase!
  msg.each_char do |x|
    print alphabet[x] , " "
  end
  puts
end

encoder("test",alphabet)


def decoder(msg, alphabet)
  msg.downcase!
  msg.split.each do |x|
    print alphabet.invert[x], " "
  end
  puts
end

decoder("tango echo sierra tango", alphabet)
