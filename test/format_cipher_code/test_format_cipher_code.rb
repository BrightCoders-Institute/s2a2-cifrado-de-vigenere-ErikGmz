# frozen_string_literal: true

require_relative '../inheritance_test_classes/test_argument_types'
require_relative '../../src/classes/format_cipher_code'

# Class to test FormatCipherCode class behavior with initialize method.
class TestFormatCipherCode < TestArgumentTypes
  UPPERCASE_LETTERS_STRING = ('A'..'Z').to_a.insert(14, 'Ñ').join
  SPECIAL_CHARACTERS = ('!'..'?').to_a

  protected

  def test_arguments(argument)
    test_arguments_with_error_name(argument, TypeError)
  end

  def test_cipher_code_argument(argument, error_name)
    assert_raises error_name do
      FormatCipherCode.new('TEST', argument)
    end

    assert_equal 'T', FormatCipherCode.new(argument, 'TEST').formatted_code

    assert_raises error_name do
      FormatCipherCode.new(argument, argument)
    end
  end

  def test_arguments_with_error_name(argument, error_name)
    assert_raises error_name do
      FormatCipherCode.new('TEST', argument)
    end

    assert_raises error_name do
      FormatCipherCode.new(argument, 'TEST')
    end

    assert_raises error_name do
      FormatCipherCode.new(argument, argument)
    end
  end

  def generate_formatter(message, cipher_code)
    FormatCipherCode.new(message, cipher_code)
  end

  public

  def test_original_first_example
    assert_equal 'SECR', generate_formatter('HOLA', 'SECRETO').formatted_code
    assert_equal 'SECR', generate_formatter('hola', 'secreto').formatted_code
    assert_equal 'SECR', generate_formatter('HoLa', 'SeCrEtO').formatted_code
  end

  def test_original_second_example
    assert_equal 'CODC', generate_formatter('RUBY', 'COD').formatted_code
    assert_equal 'CODC', generate_formatter('ruby', 'cod').formatted_code
    assert_equal 'CODC', generate_formatter('RuBy', 'CoD').formatted_code
  end

  def test_strings_with_lengths_combinations
    assert_equal 'CCCC', generate_formatter('RUBY', 'C').formatted_code
    assert_equal 'R', generate_formatter('C', 'RUBY').formatted_code
    assert_equal 'MESSAG', generate_formatter('PYTHON', 'MESSAG').formatted_code
  end

  def test_strings_with_special_characters
    assert_equal 'CCCC', generate_formatter('+-_!2RUBY.¨+-:', ',.´+C   ').formatted_code
    assert_equal 'R', generate_formatter('C', ' +++.,,,,RUBY . .. . , , ').formatted_code
    assert_equal 'MESSAG', generate_formatter('----___PYTHON _ _ - -', 'MESSAG').formatted_code
  end

  def test_alphabetic_characters
    assert_equal 'C' * 27, generate_formatter(UPPERCASE_LETTERS_STRING, 'C').formatted_code
    assert_equal 'ABCD', generate_formatter('Ruby', UPPERCASE_LETTERS_STRING).formatted_code
    assert_equal UPPERCASE_LETTERS_STRING, generate_formatter(UPPERCASE_LETTERS_STRING,
                                                              UPPERCASE_LETTERS_STRING).formatted_code
  end

  def test_empty_string_arguments
    test_arguments_with_error_name('', ArgumentError)
  end

  def test_special_characters
    SPECIAL_CHARACTERS.each { |special_character| test_cipher_code_argument(special_character, ArgumentError) }
  end
end
