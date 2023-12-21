# frozen_string_literal: true

require_relative '../../src/classes/format_cipher_code'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test FormatCipherCode class
# check_arguments_validity method behavior.
class TestCheckArgumentsValidity < TestArgumentTypes
  LOWERCASE_LETTERS = ('a'..'z').to_a.insert(14, 'ñ')
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')
  SPECIAL_CHARACTERS = ('!'..'?').to_a

  def setup
    @cipher_code_formatter = FormatCipherCode.new('HOLA', 'SECRETO')
  end

  private

  def call_method(*arguments)
    @cipher_code_formatter.send(:check_arguments_validity, *arguments)
  end

  def test_arguments(*arguments)
    assert_raises TypeError do
      call_method(*arguments)
    end
  end

  public

  def test_regular_strings
    refute_nil call_method('Hola', 'SECRETO', '+__Hola+__', '    Ruby 1.9')
  end

  def test_empty_string
    assert_raises ArgumentError do
      call_method('')
    end
  end
end
