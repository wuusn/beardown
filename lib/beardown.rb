require "beardown/version"
require "beardown/document"
#require "beardown/blocks/head"

module Beardown
  # Your code goes here...
  def self.new(text)
    Document.new(text)
  end
end
