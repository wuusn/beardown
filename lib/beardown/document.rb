require 'strscan'

module Beardown
  class Document

    def initialize(text)
      @text = text

      # These orders are important
      @blocks = [:head, :line_separator, :list_unordered, :list_ordered,
                 :quote, :list_todo, :codeblock, :asset, :blankline, :p]
      @spans  = [:codespan, :hashtag_full, :hashtag_full_nospace, :hashtag, :linkpost, :linkurl,
                 :bold, :italic, :underline, :strike, :mark_nospace, :mark]

      @extensions = Array.new
      @title = String.new
      @tags = Array.new

      html
    end

    def title
      @title
    end

    def tags
      @tags
    end

    # def assets
    #  return @assets unless defined?(@assets).nil?
    #end

    def content
      return @content if defined? @content
      @content = @text.delete "\n", "\t", "\s", "#", "*", "`", "*", "-", "_", "=", "+", "[", "]", ":", "<", ">"
    end

    def summary
      return @summary if defined? @summary
      s = content
      @summary = s[0...30]
    end

    def html
      return @html if defined? @html
      to_html
    end

    def to_html
      return @html if defined? @html
      s = StringScanner.new @text
      res = String.new
      while !s.eos? do
        res << scan_blocks(s)
      end
      res << add_extensions
      @html = res
    end

    protected

    def scan_blocks(s)
      @blocks.each do |e|
        #begin
        unless s.scan(Document.const_get("REGEXP_#{e.to_s.upcase}")).nil?
          return send "scan_#{e.to_s}", s
        end
        #rescue NameError
        #  next
        #end
      end
      return s.string
    end

    def regexp_span_like
      return @regexp_span_like unless defined?(@regexp_span_like).nil?
      res = String.new
      @spans.each do |e|
        begin
        start_char = Document.const_get("START_CHAR_#{e.to_s.upcase}")
        res << "\\#{start_char}"
        rescue NameError
          next
        end
      end
      @regexp_span_like = /[#{res}]/
    end

    def scan_spans(s)
      while !s.eos?
        last_pos = s.pos
        like = s.scan_until regexp_span_like
        if like
          s.pos -= 1
          pre = s.pre_match.to_s
          @spans.each do |e|
            #begin
            match = s.scan Document.const_get("REGEXP_#{e.to_s.upcase}")
            #rescue NameError
            #  next
            #end
            if match
              return pre + send("scan_#{e.to_s}", s) + scan_spans(StringScanner.new(s.rest))
            end
          end
          s.pos = last_pos + 1
        else
          break
        end
      end
      return s.string
    end

    def add_extensions
      res = String.new
      @extensions.each do |ex|
        res << send(ex)
      end
      res
    end

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
  end
end
