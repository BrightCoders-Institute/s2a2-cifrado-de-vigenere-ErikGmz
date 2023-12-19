# frozen_string_literal: true

require_relative './character_to_integer_encoding'
require_relative './format_cipher_code'

# Class to apply Vigenère cipher to a string using a code.
class VigenereCipher
  TOTAL_ALPHABET_LETTERS_COUNT = 26
  attr_reader :encoded_text

  def initialize(cipher_code_formatter, character_encoder, character_decoder)
    @cipher_code_formatter = cipher_code_formatter
    @character_encoder = character_encoder
    @character_decoder = character_decoder
    generate_encoded_message!
  end

  private

  def generate_encoded_message!
    integers_message = encode_string_to_numbers(@cipher_code_formatter.message)
    integers_code = encode_string_to_numbers(@cipher_code_formatter.formatted_code)
    encoded_message_integers = cipher_original_message(integers_message, integers_code)
    @encoded_text = decode_numbers_string(encoded_message_integers)
  end

  def encode_string_to_numbers(string)
    string.split('').map do |letter|
      @character_encoder.character = letter
      @character_encoder.integer_encoding
    end
  end

  def cipher_original_message(integers_message, integers_code)
    raise ArgumentError if integers_message.length != integers_code.length

    integers_message.zip(integers_code).map do |integers_pair|
      integers_pair.sum % (TOTAL_ALPHABET_LETTERS_COUNT + 1)
    end
  end

  def decode_numbers_array(integers_array)
    decoded_array = integers_array.map do |number|
      @character_decoder.integer_encoding = number
      @character_decoder.character
    end

    decoded_array.join('')
  end
end
