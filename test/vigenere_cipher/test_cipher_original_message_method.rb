# frozen_string_literal: true

require_relative '../../src/classes/vigenere_cipher'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test VigenereCipher class
# cipher_original_message method behavior.
class TestCipherOriginalMessage < TestArgumentTypes
  def setup
    @vigenere_cipher = VigenereCipher.new('HOLA', 'SECRETO')
  end

  private

  def call_method(message, code)
    @vigenere_cipher.send(:cipher_original_message, message, code)
  end

  def test_arguments(argument)
    test_arguments_with_error_name(argument, TypeError)
  end

  def test_alternative_arguments(argument, first_error_name, second_error_name)
    assert_raises first_error_name do
      call_method([0, 1, 2, 3], argument)
    end

    assert_equal argument, call_method(argument, [0, 1, 2, 3])

    assert_equal argument, call_method(argument, argument)
  end

  def test_arguments_with_error_name(argument, error_name)
    assert_raises error_name do
      call_method([0, 1, 2, 3], argument)
    end

    assert_raises error_name do
      call_method(argument, [0, 1, 2, 3])
    end

    assert_raises error_name do
      call_method(argument, argument)
    end
  end

  public

  def test_regular_integer_arrays
    assert_equal [26, 19, 13, 18], call_method([7, 15, 11, 0], [19, 4, 2, 18])
    assert_equal [20, 9, 4, 0], call_method([18, 21, 1, 25], [2, 15, 3, 2])
    assert_equal [26, 19, 13, 18, 11, 8, 26], call_method([19, 4, 2, 18, 4, 20, 15], [7, 15, 11, 0, 7, 15, 11])
  end

  def test_arrays_with_strings
    assert_equal ['-', 26, ' ', 19, '_', 13, '+', 18], call_method(['-', 7, ' ', 15, '_', 11, '+', 0], [19, 4, 2, 18])
    assert_equal ['1', '2', '3', 20, 9, 4, 0, '3', '2', '1'],
                 call_method(['1', '2', '3', 18, 21, 1, 25, '3', '2', '1'], [2, 15, 3, 2])
    assert_equal ['', 26, 19, 13, 18, 11, 8, 26, ''],
                 call_method(['', 19, 4, 2, 18, 4, 20, 15, ''], [7, 15, 11, 0, 7, 15, 11])
  end

  def test_special_arrays
    assert_equal [:A, :B, true, false, { a: 1, b: 2 }, [], 3.2],
                 call_method([:A, :B, true, false, { a: 1, b: 2 }, [], 3.2], [1, 2, 3])

    assert_raises TypeError do
      call_method([1, 2, 3, 4, 5, 6, 7], [:A, :B, true, false, { a: 1, b: 2 }, [], 3.2])
    end

    assert_raises TypeError do
      call_method(['', 1, '', 2, '', 3], ['', '', '', '', '', ''])
    end

    assert_equal [20, 22, 23], call_method([100, 100, 100], [1000, 3000, 4000])
  end

  def test_number_arguments
    test_arguments_with_error_name(0, NoMethodError)
    test_arguments_with_error_name(0.0, NoMethodError)
  end

  def test_structure_arguments
    test_alternative_arguments([true, true, true, true], TypeError, ArgumentError)
    test_alternative_arguments([[1], [2], [3], [4]], TypeError, ArgumentError)
    test_alternative_arguments([{ a: 1 }, { b: 2 }, { c: 3 }, { d: 4 }], TypeError, ArgumentError)
    test_arguments_with_error_name(:A, StandardError)
  end

  def test_boolean_argument
    test_arguments_with_error_name(true, NoMethodError)
  end

  def test_nil_argument
    test_arguments_with_error_name(nil, NoMethodError)
  end

  def test_empty_string
    assert_equal ['', '', '', ''], call_method(['', '', '', ''], [0, 0, 0, 0])
    test_arguments_with_error_name('', StandardError)
  end
end
