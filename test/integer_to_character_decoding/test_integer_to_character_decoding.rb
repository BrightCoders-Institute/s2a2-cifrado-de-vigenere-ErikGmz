# frozen_string_literal: true

require_relative '../inheritance_test_classes/test_argument_types'
require_relative '../../src/classes/integer_to_character_decoding'

# Class to test IntegerToCharacterDecoding class behavior with initialize method.
class TestIntegerToCharacterDecoding < TestArgumentTypes
  ALPHABET_NUMBERS_SEQUENCE = (0..26).freeze
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')

  protected

  def generate_decoder(argument = nil)
    IntegerToCharacterDecoding.new(argument)
  end

  def test_arguments(argument)
    assert_raises TypeError do
      generate_decoder(argument)
    end
  end

  public

  def test_all_alphabet_numbers_sequence
    assert_equal UPPERCASE_LETTERS, (ALPHABET_NUMBERS_SEQUENCE.to_a.map do |integer|
      generate_decoder(integer).character
    end)
  end

  def test_non_alphabet_numbers
    test_numbers = ALPHABET_NUMBERS_SEQUENCE.to_a.delete_if { |number| ALPHABET_NUMBERS_SEQUENCE === number }

    test_numbers.each do |number|
      assert_raises ArgumentError do
        generate_decoder(number)
      end
    end
  end

  def test_number_arguments
    test_arguments(0.0)
  end

  def test_nil_argument
    assert_nil generate_decoder.character
  end
end
