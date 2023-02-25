# frozen_string_literal: true

require 'test_helper'

class RutieRubyExampleTest < Minitest::Test
  CROISSANT_PALLETE = [
    { r: 22, g: 142, b: 204 },
    { r: 180, g: 65, b: 33 },
    { r: 218, g: 219, b: 220 },
    { r: 222, g: 139, b: 66 },
    { r: 124, g: 212, b: 247 },
    { r: 235, g: 188, b: 135 },
    { r: 201, g: 143, b: 125 },
    { r: 172, g: 209, b: 231 },
    { r: 75, g: 22, b: 24 }
  ].freeze

  def test_it_pallete
    assert_equal CROISSANT_PALLETE, ColorThief.pallete('images/croissant.jpeg')
  end
end
