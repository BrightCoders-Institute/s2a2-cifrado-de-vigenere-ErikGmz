# frozen_string_literal: true

require_relative '../inheritance_test_classes/test_argument_types'
require_relative '../../src/classes/character_to_integer_encoding'

# Class to test CharacterToIntegerEncoding class behavior with initialize method.
class TestCharacterToIntegerEncoding < TestArgumentTypes
  LOWERCASE_LETTERS = ('a'..'z').to_a.insert(14, 'ñ')
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')
  SPECIAL_CHARACTERS = ('!'..'?').to_a

  protected

  def generate_encoder(argument = nil)
    CharacterToIntegerEncoding.new(argument)
  end

  def test_arguments(argument)
    assert_nil generate_encoder(argument).integer_encoding
  end

  private

  def test_all_alphabet_symbols
    test_range = (0..26).to_a

    # Test lowercase letters.
    assert_equal test_range, (LOWERCASE_LETTERS.map do |letter|
      generate_encoder(letter.to_sym).integer_encoding
    end)

    # Test uppercase letters.
    assert_equal test_range, (UPPERCASE_LETTERS.map do |letter|
      generate_encoder(letter.to_sym).integer_encoding
    end)
  end

  public

  def test_all_alphabet_letters
    test_range = (0..26).to_a

    # Test lowercase letters.
    assert_equal test_range, (LOWERCASE_LETTERS.map do |letter|
      generate_encoder(letter).integer_encoding
    end)

    # Test uppercase letters.
    assert_equal test_range, (UPPERCASE_LETTERS.map do |letter|
      generate_encoder(letter).integer_encoding
    end)
  end

  def test_special_characters
    SPECIAL_CHARACTERS.each do |character|
      assert_equal character, generate_encoder(character).integer_encoding
    end
  end

  def test_larger_strings
    assert_equal 'A', generate_encoder('AA').integer_encoding

    # Test a string with all lowercase letters joined.
    assert_equal LOWERCASE_LETTERS.first, generate_encoder(LOWERCASE_LETTERS.join).integer_encoding
  end

  def test_structure_arguments
    test_arguments([])
    test_arguments({})
    test_all_alphabet_symbols
  end
end
