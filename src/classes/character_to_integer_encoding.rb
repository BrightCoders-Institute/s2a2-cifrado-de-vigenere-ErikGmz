# frozen_string_literal: true

require_relative '../inheritance_classes/arguments_data_validation'

# Class to convert an alphabet letter to its corresponding secuential number.
class CharacterToIntegerEncoding < ArgumentsDataValidation
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

  def check_arguments_validity(*arguments)
    arguments.each do |argument|
      raise TypeError unless argument.is_a?(String)

      raise ArgumentError unless LETTERS_MAPPING.keys.include?(argument.upcase.to_sym)
    end
  end

  def config_character!(character)
    if character.nil?
      @integer_encoding = nil
      return
    end

    check_arguments_validity(character)

    @character = character[0].upcase
    @integer_encoding = LETTERS_MAPPING[@character.to_sym]
  end
end
