require "beardown/version"
require "beardown/document"
require "beardown/blocks/head"
require "beardown/blocks/line_separator"
require "beardown/blocks/list_unordered"
require "beardown/blocks/list_ordered"
require "beardown/blocks/quote"
require "beardown/blocks/list_todo"
require "beardown/blocks/codeblock"
require "beardown/blocks/asset"
require "beardown/blocks/blankline"
require "beardown/blocks/p"
require "beardown/spans/bold_italic_underline_strike"
require "beardown/spans/linkurl"
require "beardown/spans/linkpost"
require "beardown/spans/mark"
require "beardown/spans/hashtag"
require "beardown/spans/codespan"

module Beardown
  # Your code goes here...
  def self.new(text)
    Document.new(text)
  end
end
