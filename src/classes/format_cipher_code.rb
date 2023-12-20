# frozen_string_literal: true

require_relative '../inheritance_classes/arguments_data_validation'

# Class to adjust a cipher code to its message.
class FormatCipherCode < ArgumentsDataValidation
  UPPERCASE_LETTERS = ('A'..'Z').to_a.insert(14, 'Ñ')
  attr_reader :message, :formatted_code

  def initialize(message, cipher_code)
    super
    check_arguments_validity(message, cipher_code)
    check_cipher_code_validity(cipher_code)

    @message = message.upcase
    @cipher_code = cipher_code.upcase.gsub(/[^A-ZÑ]+/, '')
    generate_formatted_cipher_code!
  end

  def message=(message)
    check_arguments_validity(message)

    @message = message.upcase
    generate_formatted_cipher_code!
  end

  def cipher_code=(cipher_code)
    check_arguments_validity(cipher_code)
    check_cipher_code_validity(cipher_code)

    @cipher_code = cipher_code.upcase.gsub(/[^A-ZÑ]+/, '')
    generate_formatted_cipher_code!
  end

  private

  def check_arguments_validity(*arguments)
    arguments.each do |argument|
      raise TypeError unless argument.is_a?(String)

      raise ArgumentError if argument.empty?
    end
  end

  def check_cipher_code_validity(cipher_code)
    raise ArgumentError if cipher_code.upcase.gsub(/[^A-ZÑ]+/, '').empty?
  end

  def generate_formatted_cipher_code!
    message_with_alphabetic_characters = @message.gsub(/[^A-ZÑ]+/, '')

    adjusted_cipher_code = @cipher_code.dup
    adjusted_cipher_code << @cipher_code while adjusted_cipher_code.length < message_with_alphabetic_characters.length
    @formatted_code = adjusted_cipher_code[0...@message.length]
  end
end
