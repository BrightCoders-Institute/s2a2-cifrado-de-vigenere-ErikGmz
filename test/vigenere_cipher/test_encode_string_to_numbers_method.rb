# frozen_string_literal: true

require_relative '../../src/classes/vigenere_cipher'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test VigenereCipher class
# encode_string_to_numbers method behavior.
class TestEncodeStringToNumbers < TestArgumentTypes
  def setup
    @vigenere_cipher = VigenereCipher.new('HOLA', 'SECRETO')
  end

  private

  def call_method(string)
    @vigenere_cipher.send(:encode_string_to_numbers, string)
  end

  def test_arguments(argument)
    assert_raises NoMethodError do
      call_method(argument)
    end
  end

  public

  def test_regular_strings
    assert_equal [7, 15, 11, 0], call_method('HOLA')
    assert_equal [7, 15, 11, 0], call_method('hola')
    assert_equal [7, 15, 11, 0], call_method('HoLa')
    assert_equal [19, 4, 2, 18, 4, 20, 15], call_method('SECRETO')
    assert_equal [19, 4, 2, 18, 4, 20, 15], call_method('secreto')
    assert_equal [19, 4, 2, 18, 4, 20, 15], call_method('SeCrETo')
  end

  def test_special_strings
    assert_equal [' ', ' ', ' ', '_', 7, 15, 11, 0, '_', ' ', ' ', ' ', ' '], call_method('   _HOLA_    ')
    assert_equal ['1', ' ', '2', ' ', '3', '4', '5', '6', 7, 15, 11, 0, '1', '2', '3', '4', ' ', '5', ' ', '6'],
                 call_method('1 2 3456hola1234 5 6')
    assert_equal ['+', '*', '/', '-', '?', '?', 7, 15, 11, 0], call_method('+*/-??HoLa')
    assert_equal [' ', ',', ',', ',', 19, 4, 2, 18, 4, 20, 15, ',', ',', ',', ' '], call_method(' ,,,SECRETO,,, ')
    assert_equal ['+', '-', '*', '/', '*', '-', '-', '-', '.', '-', ' ', ' ', ' ', '-', '5',
                  '3', '4', '9', '3', '8', '2', '0', '1', '0', '4', '5'],
                 call_method('+-*/*---.-   -534938201045')
    assert_equal [19, '1', 4, '2', 2, '3', 18, '4', 4, '5', 20, '6', 15, '7', ':', 0, ':', 1],
                 call_method('S1e2C3r4E5T6o7:A:B')
  end

  def test_random_array_data
    test_arguments([:A, :B, true, false, { a: 1, b: 2 }, [], 3.2])
  end

  def test_empty_string
    assert_equal [], call_method('')
  end
end
