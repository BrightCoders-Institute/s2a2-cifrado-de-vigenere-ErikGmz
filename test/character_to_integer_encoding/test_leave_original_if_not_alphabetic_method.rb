# frozen_string_literal: true

require_relative '../../src/classes/character_to_integer_encoding'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test CharacterToIntegerEncoding class
# leave_original_if_not_alphabetic! method behavior.
class TestLeaveOriginalIfNotAlphabetic < TestArgumentTypes
  LOWERCASE_LETTERS = ('a'..'z').to_a.insert(14, 'ñ')
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')
  SPECIAL_CHARACTERS = ('!'..'?').to_a

  def setup
    @character_to_integer_encoding = CharacterToIntegerEncoding.new('A')
  end

  private

  def call_method(argument)
    @character_to_integer_encoding.send(:leave_original_if_not_alphabetic!, argument)
  end

  def test_arguments(argument)
    assert call_method(argument)
    assert_nil @character_to_integer_encoding.integer_encoding
  end

  public

  def test_all_alphabet_letters
    # Test lowercase letters.
    LOWERCASE_LETTERS.each do |letter|
      refute call_method(letter)
    end

    # Test uppercase letters.
    UPPERCASE_LETTERS.each do |letter|
      refute call_method(letter)
    end
  end

  def test_special_characters
    SPECIAL_CHARACTERS.each do |letter|
      assert call_method(letter)
      assert_equal letter, @character_to_integer_encoding.integer_encoding
    end
  end

  def test_longer_strings
    assert call_method('String')
    assert_equal 'S', @character_to_integer_encoding.integer_encoding

    assert call_method('___ String ___')
    assert_equal '_', @character_to_integer_encoding.integer_encoding

    assert call_method('ñ__ String ___')
    assert_equal 'ñ', @character_to_integer_encoding.integer_encoding
  end
end
