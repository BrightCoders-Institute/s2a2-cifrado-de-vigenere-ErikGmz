# frozen_string_literal: true

require './classes/vigenere_cipher'
require './classes/format_cipher_code'
require './classes/character_to_integer_encoding'

message, cipher_code = ARGV
vigenere_cipher = VigenereCipher.new(message, cipher_code)
