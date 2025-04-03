# frozen_string_literal: true

class CaeserCypher
  def initialize(string, shift)
    @string = string
    @shift = shift
    @shifted_numbers = []
    @encoded_message = nil
  end

  def run_caeser_cypher
    number_array = create_number_array
    @shifted_numbers = create_switch(number_array, @shift)
    encode_message
    print_encoded_message
  end

  private

  def create_number_array
    @string.chars.map(&:ord)
  end

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

  def encode_message
    @encoded_message = @shifted_numbers.map(&:chr).join
  end

  def print_encoded_message
    puts @encoded_message
  end
end

cypher = CaeserCypher.new('I am a cat!', 4)
cypher.run_caeser_cypher
