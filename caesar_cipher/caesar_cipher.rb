# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
# collect user's input
def caesar_cipher(string, key)
    alphabet = ('a'..'z').to_a * 2  #this is to wrap z to a
    puts "Enter a string: "
    string = gets.chomp
    letters = string.split("")
    p letters  #an arrays of letters
    puts "Enter a key: "
    key = gets.chomp.to_i  #worked

# assign to each letter a numeber based on alphabet index + the key
    numbers = letters.map do |letter|
      # a space also has string class, NOT nil
      if alphabet.index(letter) == nil
        next
      end
        alphabet.index(letter) + key
    end
    p numbers #numbers = [8, 23, 5, 10]

# assign numbers back to letters to the alphabet
    # reversed_alphabet = alphabet.reverse # wrap from z to a
    result = numbers.map do |number|
      if number == nil
        next
        puts " "
      end
        alphabet[number]
    end
    p result.join   #result = ["b", "m", "f", "y", nil, "f"]
end
caesar_cipher("What a string!", 5)
