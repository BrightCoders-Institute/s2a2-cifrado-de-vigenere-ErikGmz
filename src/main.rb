# frozen_string_literal: true

require_relative './classes/vigenere_cipher'

begin
  raise ArgumentError, 'The program requires exactly two ARGV arguments.' if ARGV.length != 2

  message, cipher_code = ARGV
  vigenere_cipher = VigenereCipher.new(message, cipher_code)

  puts "Message: #{message}."
  puts "Cipher Code: #{cipher_code}."
  puts "Encoded Message: #{vigenere_cipher.encoded_message}."
rescue StandardError => e
  puts 'An error has ocurred.'
  puts e.message
end
