# frozen_string_literal: true

require_relative '../../src/classes/vigenere_cipher'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test VigenereCipher class
# decode_numbers_array method behavior.
class TestDecodeNumbersArray < TestArgumentTypes
  def setup
    @vigenere_cipher = VigenereCipher.new('HOLA', 'SECRETO')
  end

  private

  def call_method(string)
    @vigenere_cipher.send(:decode_numbers_array, string)
  end

  def test_arguments(argument)
    assert_raises NoMethodError do
      call_method(argument)
    end
  end

  public

  def test_regular_integer_arrays
    assert_equal 'HOLA', call_method([7, 15, 11, 0])
    assert_equal 'SECRETO', call_method([19, 4, 2, 18, 4, 20, 15])
    assert_equal 'RUBY', call_method([18, 21, 1, 25])
    assert_equal 'COD', call_method([2, 15, 3])
  end

  def test_special_arrays
    assert_equal '', call_method([:A, :B, true, false, { a: 1, b: 2 }, [], 3.2])
    assert_equal '', call_method([100, 100, 100, 100])
    assert_equal '_- HOLA -_', call_method(['_', '-', ' ', 7, 15, 11, 0, ' ', '-', '_'])
    assert_equal '+_1H2O3LA4:_ ', call_method(['+', '_', '1', 7, '2', 15, '3', 11, 0, '4', ':', '_', ' '])
    assert_equal '+++___+++', call_method(['+', '+', '+', '_', '_', '_', '+', '+', '+'])
  end

  def test_structure_arguments
    assert_equal '', call_method([[1], [2], [3]])
    assert_equal '', call_method([{ a: 1 }, { b: 2 }, { c: 3 }])
    assert_equal '', call_method({})
    assert_equal '', call_method({ a: 1, b: 2 })
    test_arguments(:A)
  end

  def test_empty_string
    assert_equal '', call_method([''])
    test_arguments('')
  end
end
