# frozen_string_literal: true

require_relative '../../src/classes/integer_to_character_decoding'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test IntegerToCharacterDecoding class
# leave_original_if_not_alphabetic! method behavior.
class TestLeaveOriginalIfNotAlphabetic < TestArgumentTypes
  ALPHABET_NUMBERS_SEQUENCE = (0..26).freeze
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')

  def setup
    @integer_to_character_encoding = IntegerToCharacterDecoding.new(0)
  end

  private

  def call_method(argument)
    @integer_to_character_encoding.send(:leave_original_if_not_alphabetic!, argument)
  end

  def test_arguments(argument)
    assert call_method(argument)
    assert_nil @integer_to_character_encoding.character
  end

  public

  def test_all_alphabet_numbers_sequence
    ALPHABET_NUMBERS_SEQUENCE.to_a.each do |integer|
      refute call_method(integer)
    end
  end

  def test_non_alphabet_numbers
    test_numbers = (0..100).to_a.delete_if { |number| ALPHABET_NUMBERS_SEQUENCE === number }

    test_numbers.each do |number|
      test_arguments(number)
    end
  end

  def test_strings
    assert call_method('AA')
    assert 'A', @integer_to_character_encoding.character

    assert call_method('0')
    assert '0', @integer_to_character_encoding.character

    # Test a string with all uppercase letters joined.
    assert call_method(UPPERCASE_LETTERS.join)
    assert_equal UPPERCASE_LETTERS.first, @integer_to_character_encoding.character
  end

  def test_number_arguments
    test_arguments(0.0)
  end

  def test_structure_arguments
    test_arguments([])
    test_arguments({})

    ALPHABET_NUMBERS_SEQUENCE.to_a.map do |integer|
      test_arguments(integer.to_s.to_sym)
    end
  end
end
