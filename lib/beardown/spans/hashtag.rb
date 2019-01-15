module Beardown
  class Document
    START_CHAR_HASHTAG = "#"

    REGEXP_HASHTAG_FULL = /#([^\s^#][^#]*[^\s^#])#/
    REGEXP_HASHTAG_FULL_NOSPACE = /#([^#^\s]+)#/
    REGEXP_HASHTAG = /#([^#\s\,]+)/

    ["_full", "_full_nospace"].each do |attr|
      define_method :"scan_hashtag#{attr}" do |s|
        tag = s[1]
        send "convert_hashtag#{attr}", tag
      end

      define_method :"convert_hashtag#{attr}" do |tag|
        tag = tag.downcase
        render_hashtag tag
        %(<a href="../tag/#{tag}/" class="hashtag">##{tag}#</a>)
      end
    end

    def scan_hashtag(s)
      tag = s[1]
      if check_color(tag)
        convert_hashcolor tag
      else
        convert_hashtag tag
      end
    end

    def convert_hashtag(tag)
      tag = tag.downcase
      render_hashtag tag
      %(<a href="../tag/#{tag}/" class="hashtag">##{tag}</a>)
    end

    def check_color(tag)
      return false if(tag.length!=6)
      return tag.match? /[0-9a-fA-F]{6}/
    end

    def convert_hashcolor(hex)
      %(<span class='color-preview' style='background-color:##{hex}'></span><span class='color-code'><span class='color-hash'>#</span>#{hex}</span></span>)
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
