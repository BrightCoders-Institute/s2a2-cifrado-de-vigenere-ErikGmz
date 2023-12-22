# frozen_string_literal: true

require_relative './format_cipher_code'
require_relative './character_to_integer_encoding'
require_relative './integer_to_character_decoding'

# Class to apply Vigenère cipher to a string using a code.
class VigenereCipher
  TOTAL_ALPHABET_LETTERS_COUNT = 26
  attr_reader :encoded_message

  def initialize(message, cipher_code)
    @character_encoder = CharacterToIntegerEncoding.new
    @character_decoder = IntegerToCharacterDecoding.new
    @cipher_code_formatter = FormatCipherCode.new(message, cipher_code)
    generate_encoded_message!
  end

  private

  def generate_encoded_message!
    integers_message = encode_string_to_numbers(@cipher_code_formatter.message)
    integers_code = encode_string_to_numbers(@cipher_code_formatter.formatted_code)
    encoded_message_integers = cipher_original_message(integers_message, integers_code)
    @encoded_message = decode_numbers_array(encoded_message_integers)
  end

  def encode_string_to_numbers(string)
    string.split('').map do |letter|
      @character_encoder.character = letter
      @character_encoder.integer_encoding
    end
  end

  def cipher_original_message(integers_message, integers_code)
    raise ArgumentError, 'The message is shorter than code.' if integers_message.length < integers_code.length

    integers_code_index = -1
    integers_message.map do |integer|
      if integer.is_a?(Integer)
        integers_code_index += 1
        (integer + integers_code[integers_code_index]) % (TOTAL_ALPHABET_LETTERS_COUNT + 1)
      else
        integer
      end
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
