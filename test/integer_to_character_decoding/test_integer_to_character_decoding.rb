# frozen_string_literal: true

require_relative '../../src/classes/integer_to_character_decoding'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test IntegerToCharacterDecoding class behavior with initialize method.
class TestIntegerToCharacterDecoding < TestArgumentTypes
  ALPHABET_NUMBERS_SEQUENCE = (0..26).freeze
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')

  protected

  def generate_decoder(argument = nil)
    IntegerToCharacterDecoding.new(argument)
  end

  def test_arguments(argument)
    assert_nil generate_decoder(argument).character
  end

  public

  def test_all_alphabet_numbers_sequence
    assert_equal UPPERCASE_LETTERS, (ALPHABET_NUMBERS_SEQUENCE.to_a.map do |integer|
      generate_decoder(integer).character
    end)
  end

  def test_non_alphabet_numbers
    test_numbers = (0..100).to_a.delete_if { |number| ALPHABET_NUMBERS_SEQUENCE === number }

    test_numbers.each do |number|
      test_arguments(number)
    end
  end

  def test_strings
    assert_equal 'A', generate_decoder('AA').character
    assert_equal '0', generate_decoder('0').character

    # Test a string with all uppercase letters joined.
    assert_equal UPPERCASE_LETTERS.first, generate_decoder(UPPERCASE_LETTERS.join).character
  end

  def test_number_arguments
    test_arguments(0.0)
  end

  def test_structure_arguments
    test_arguments([])
    test_arguments({})

    ALPHABET_NUMBERS_SEQUENCE.to_a.map do |integer|
      assert_nil generate_decoder(integer.to_s.to_sym).character
    end
  end
end
