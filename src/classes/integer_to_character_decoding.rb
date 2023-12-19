# frozen_string_literal: true

require_relative '../inheritance_classes/arguments_data_validation'

# Class to convert a secuential number to its corresponding alphabet letter.
class IntegerToCharacterDecoding < ArgumentsDataValidation
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

  def check_arguments_validity(*arguments)
    arguments.each do |argument|
      raise TypeError unless argument.is_a?(Integer)

      raise ArgumentError unless INTEGERS_MAPPING.keys.include?(argument.to_s.to_sym)
    end
  end

  def decode_integer!(integer_encoding)
    if integer_encoding.nil?
      @character = nil
      return
    end

    check_arguments_validity(integer_encoding)

    @integer_encoding = integer_encoding
    @character = INTEGERS_MAPPING[@integer_encoding.to_s.to_sym]
  end
end
