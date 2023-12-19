# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../src/classes/vigenere_cipher'

# Class to test VigenereCipher class general behavior.
class TestVigenereCipher < Minitest::Test
  def test_original_first_example
    vigenere_cipher = VigenereCipher.new('HOLA', 'SECRETO')
    assert_equal 'SECR', vigenere_cipher.send(:adjust_cipher_code)
  end

  def test_original_second_example
    vigenere_cipher = VigenereCipher.new('RUBY', 'COD')
    assert_equal 'CODC', vigenere_cipher.send(:adjust_cipher_code)
  end
end
