# frozen_string_literal: true

require_relative '../inheritance_classes/arguments_data_validation'
require_relative '../inheritance_classes/encoding_control'

# Class to convert a secuential number to its corresponding alphabet letter.
class IntegerToCharacterDecoding < EncodingControl
  INTEGERS_MAPPING = Hash[('A'..'Z').to_a.insert(14, 'Ñ').each_with_index.map do |letter, index|
    [index.to_s.to_sym, letter]
  end]
  attr_reader :integer_encoding, :character

  def initialize(integer_encoding = nil)
    super
    decode_integer!(integer_encoding)
  end

  def integer_encoding=(integer_encoding)
    decode_integer!(integer_encoding)
  end

  private

  def leave_original_if_not_alphabetic!(integer_encoding)
    unless INTEGERS_MAPPING.keys.include?(integer_encoding.to_s.to_sym) && integer_encoding.is_a?(Integer)
      @character = integer_encoding.is_a?(String) ? integer_encoding[0] : nil
      return true
    end
    false
  end

  def decode_integer!(integer_encoding)
    return if leave_original_if_not_alphabetic!(integer_encoding)

    @integer_encoding = integer_encoding
    @character = INTEGERS_MAPPING[@integer_encoding.to_s.to_sym]
  end
end
