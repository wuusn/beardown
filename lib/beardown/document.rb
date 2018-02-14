require 'strscan'

module Beardown
  class Document

    def initialize(text)
      @text = text
      @blocks = [:head, :line_separator, :list_unordered, :list_ordered,
                 :qupte, :todolist, :codeblock, :asset, :blankline, :p]
      @spans  = [:bold, :italic, :underline, :strike, :linkurl, :linkpost,
                 :mark, :hashtag, :codespan]
    end

    def title
      return @title unless @title.nil?
    end

    def tags
      return @tags unless @tags.nil?
    end

    def assets
      return @assets unless @assets.nil?
    end

    def content
      return @content unless @content.nil?
    end

    def summary
      return @summary unless @summary.nil?
      s = content
      @summary = s[0...30]
    end

    def html
      return @html unless @html.nil?
      to_html
    end

    def to_html
      return @html unless @html.nil?
      s = StringScanner.new @text
      res = String.new
      while !s.eos? do
        res << scan_blocks(s)
      end
      @html = res
    end

    protected

    def scan_blocks(s)
      @blocks.each do |e|
        unless s.scan(Document.const_get("REGEXP_#{e.to_s.upcase}")).nil?
          return send "scan_#{e.to_s}", s
        end
      end
    end

    def scan_spans(s)
      @spans.each do |e|
        res = s.scan(Document.const_get("REGEXP_#{e.to_s.upcase}"))
        return send "scan_#{e.to_s}", StringScanner.new(res) unless res.nil?
      end
      return s.to_s
    end

    require "beardown/blocks/head"
    require "beardown/blocks/line_separator"
    require "beardown/blocks/list_unordered"
    require "beardown/blocks/list_ordered"
    require "beardown/blocks/quote"
    require "beardown/blocks/todolist"
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
  end
end
