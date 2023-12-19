# frozen_string_literal: true

require_relative '../../src/classes/character_to_integer_encoding'
require_relative './test_character_to_integer_encoding'

# Class to test CharacterToIntegerEncoding class behavior with setter.
class TestCharacterToIntegerEncodingSetter < TestCharacterToIntegerEncoding
  def setup
    @character_to_integer_encoding = CharacterToIntegerEncoding.new('A')
  end

  private

  def generate_encoder(argument = nil)
    @character_to_integer_encoding.character = argument
    @character_to_integer_encoding
  end
end
