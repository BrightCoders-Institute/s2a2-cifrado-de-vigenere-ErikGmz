# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../src/classes/vigenere_cipher'
require_relative '../inheritance_test_classes/test_argument_types'

# Class to test VigenereCipher class general behavior.
class TestVigenereCipher < TestArgumentTypes
  private

  def test_arguments(argument)
    test_arguments_with_error_name(argument, TypeError)
  end

  def test_arguments_with_error_name(argument, error_name)
    assert_raises error_name do
      VigenereCipher.new('TEST', argument)
    end

    assert_raises error_name do
      VigenereCipher.new(argument, 'TEST')
    end

    assert_raises error_name do
      VigenereCipher.new(argument, argument)
    end
  end

  public

  def test_original_examples
    assert_equal 'ZSNR', VigenereCipher.new('HOLA', 'SECRETO').encoded_message
    assert_equal 'TJEA', VigenereCipher.new('RUBY', 'COD').encoded_message
  end

  def test_examples_with_spaces
    assert_equal 'ÑONÑEMISVYNFMRVOLEUEARKVVEDLUIMWEHZU',
                 VigenereCipher.new('Mensajedeejemploparalapruebaunitaria', 'Clavedeprueba').encoded_message
    assert_equal 'ÑONÑEMI SV YNFMRVO LEUE AR KVVEDL UIMWEHZU',
                 VigenereCipher.new('Mensaje de ejemplo para la prueba unitaria', 'Clave de prueba').encoded_message
    assert_equal 'ÑONÑE MI SVYNFM',
                 VigenereCipher.new('CLAVE dE pRuEbA', 'MeNsAjE dE eJeMpLo PaRa La PrUeBa UnItArIa').encoded_message
    assert_equal 'ÑONÑEMISVYNFM',
                 VigenereCipher.new('CLAVEDEPRUEBA', 'MENSAJEDEEJEMPLOPARALAPRUEBAUNITARIA').encoded_message
  end

  def test_examples_with_special_characters
    assert_equal '+-_!222TWDA222.¨+-:',
                 VigenereCipher.new('+-_!222RUBY222.¨+-:', ',.´+C   ').encoded_message
    assert_equal 'T',
                 VigenereCipher.new('C', ' +++.,,,,RUBY . .. . , , ').encoded_message
    assert_equal '----___BCMZOS _ _ - -',
                 VigenereCipher.new('----___PYTHON _ _ - -', 'MESSAG').encoded_message
  end

  def test_empty_strings
    test_arguments_with_error_name('', ArgumentError)
  end
end
