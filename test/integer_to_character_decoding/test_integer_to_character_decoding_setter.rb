# frozen_string_literal: true

require_relative '../../src/classes/integer_to_character_decoding'
require_relative './test_integer_to_character_decoding'

# Class to test IntegerToCharacterDecoding class behavior with setter.
class TestIntegerToCharacterDecodingSetter < TestIntegerToCharacterDecoding
  def setup
    @integer_to_character_decoding = IntegerToCharacterDecoding.new(0)
  end

  private

  def generate_decoder(argument = nil)
    @integer_to_character_decoding.integer_encoding = argument
    @integer_to_character_decoding
  end
end
