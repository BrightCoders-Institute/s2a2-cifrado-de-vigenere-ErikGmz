# frozen_string_literal: true

require_relative '../inheritance_classes/arguments_data_validation'
require_relative '../inheritance_classes/encoding_control'

# Class to convert an alphabet letter to its corresponding secuential number.
class CharacterToIntegerEncoding < EncodingControl
  LETTERS_MAPPING = Hash[(:A..:Z).to_a.insert(14, :Ñ).each_with_index.map do |letter, index|
    [letter, index]
  end]
  attr_reader :character, :integer_encoding

  def initialize(character = nil)
    super
    config_character!(character)
  end

  def character=(character)
    config_character!(character)
  end

  private

  def leave_original_if_not_alphabetic!(character)
    unless LETTERS_MAPPING.keys.include?(character.to_s.upcase.to_sym)
      @integer_encoding = character.is_a?(String) ? character[0] : nil
      return true
    end
    false
  end

  def config_character!(character)
    return if leave_original_if_not_alphabetic!(character)

    @character = character.to_s.upcase
    @integer_encoding = LETTERS_MAPPING[@character.to_sym]
  end
end
