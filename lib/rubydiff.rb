require 'rubydiff/version'
require 'pathname'

module Rubydiff
  module Format
  end

  def self.root_path
    @root_path ||= Pathname.new(File.dirname(File.expand_path(__dir__)))
  end
end

require 'rubydiff/diff'
require 'rubydiff/line'
require 'rubydiff/format/text'
