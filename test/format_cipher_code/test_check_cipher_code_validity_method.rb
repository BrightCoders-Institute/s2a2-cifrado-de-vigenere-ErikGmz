# frozen_string_literal: true

require_relative '../../src/classes/format_cipher_code'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test FormatCipherCode class
# check_cipher_code_validity method behavior.
class TestCheckCipherCodeValidity < TestArgumentTypes
  LOWERCASE_LETTERS = ('a'..'z').to_a.insert(14, 'ñ')
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')
  SPECIAL_CHARACTERS = ('!'..'?').to_a

  def setup
    @cipher_code_formatter = FormatCipherCode.new('HOLA', 'SECRETO')
  end

  private

  def call_method(cipher_code)
    @cipher_code_formatter.send(:check_cipher_code_validity, cipher_code)
  end

  def test_arguments(argument)
    assert_raises NoMethodError do
      call_method(argument)
    end
  end

  public

  def test_regular_strings
    assert_nil call_method('HOLA')
    assert_nil call_method('hola')
    assert_nil call_method('__+++    Hola .-.-.-.-.')
    assert_nil call_method('   HOLA--------')
  end

  def test_alternative_strings
    assert_raises ArgumentError do
      call_method('')
    end

    assert_raises ArgumentError do
      call_method('+++++++---------')
    end
  end
end
