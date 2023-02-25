# frozen_string_literal: true

require_relative "color_thief_ruby/version"
require 'rutie'

module ColorThiefRuby
  class Error < StandardError; end

  Rutie.new(:color_thief_ruby).init 'Init_color_thief_ruby', __dir__
end
