module Beardown
  class Document
    START_CHAR_HASHTAG = "#"

    REGEXP_HASHTAG_FULL = /#([^\s^#][^#]*[^\s^#])#/
    REGEXP_HASHTAG_FULL_NOSPACE = /#([^#^\s]+)#/
    REGEXP_HASHTAG = /#([^#\s\,]+)/

    ["", "_full", "_full_nospace"].each do |attr|
      define_method :"scan_hashtag#{attr}" do |s|
        tag = s[1]
        send "convert_hashtag#{attr}", tag
      end

      define_method :"convert_hashtag#{attr}" do |tag|
        tag = tag.downcase
        render_hashtag tag
        sym = case attr
              when "" then ""
              else "#"
              end
      %(<a href="../tag/#{tag}/" class="hashtag">##{tag+sym}</a>)
      end
    end

    def render_hashtag(tag)
      tag = tag.downcase
      tags = tag.split "/"
      _tag = tags[0]
      @tags << _tag unless @tags.include? _tag
      tags[1..-1].each do |t|
        _tag += "/#{t}"
        @tags << _tag unless @tags.include? _tag
      end
    end
  end
end
