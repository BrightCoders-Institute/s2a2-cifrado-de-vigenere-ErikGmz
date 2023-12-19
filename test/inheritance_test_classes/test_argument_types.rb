# frozen_string_literal: true

require 'minitest/autorun'

# Class to specify arguments types testing methods.
class TestArgumentTypes < Minitest::Test
  protected

  def test_arguments(_argument); end

  public

  def test_number_arguments
    test_arguments(0)
    test_arguments(0.0)
  end

  def test_structure_arguments
    test_arguments([])
    test_arguments({})
    test_arguments(:A)
  end

  def test_boolean_argument
    test_arguments(true)
  end

  def test_nil_argument
    test_arguments(nil)
  end
end
