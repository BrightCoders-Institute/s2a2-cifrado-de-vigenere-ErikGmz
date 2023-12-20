# frozen_string_literal: true

require_relative './classes/vigenere_cipher'

message, cipher_code = ARGV
vigenere_cipher = VigenereCipher.new('HOLA', 'SECRETO')
