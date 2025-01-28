def caeser_cypher(string, shift)
  
  number_array = string.chars.map(&:ord)

  def create_switch(number_array, shift)
    number_array.map do |ordinal|
      if ordinal.between?(65, 90) # Uppercase letters
        ((ordinal - 65 + shift) % 26 + 65)
      elsif ordinal.between?(97, 122) # Lowercase letters
        ((ordinal - 97 + shift) % 26 + 97)
      else
        ordinal # Non-alphabet characters remain unchanged
      end
    end
  end

  shifted_numbers = create_switch(number_array, shift)

  #reconvert to letters and join words
  encoded_message = shifted_numbers.map(&:chr).join

  puts "#{encoded_message}"
end

caeser_cypher("I am a cat!", 4)




