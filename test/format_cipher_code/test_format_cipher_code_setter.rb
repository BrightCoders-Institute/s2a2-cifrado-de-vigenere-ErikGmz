# frozen_string_literal: true

require_relative '../../src/classes/format_cipher_code'
require_relative './test_format_cipher_code'

# Class to test FormatCipherCode class behavior with message setter methods.
class TestFormatCipherCodeSetters < TestArgumentTypes
  def setup
    @cipher_code_formatter = FormatCipherCode.new('HOLA', 'SECRETO')
  end

  private

  def generate_formatter(message, cipher_code)
    @cipher_code_formatter.message = message
    @cipher_code_formatter.cipher_code = cipher_code
    @cipher_code_formatter
  end
end
