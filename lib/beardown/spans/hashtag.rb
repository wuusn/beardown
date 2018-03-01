module Beardown
  class Document
    START_CHAR_HASHTAG = "#"

    REGEXP_HASHTAG_FULL = /#([^\s^#][^#]*[^\s^#])#/
    REGEXP_HASHTAG_FULL_NOSPACE = /#([^#^\s]+)#/
    REGEXP_HASHTAG = /#([\w\-]+)/

    ["", "_full", "_full_nospace"].each do |attr|
      define_method :"scan_hashtag#{attr}" do |s|
        tag = s[1]
        send "convert_hashtag#{attr}", tag
      end

      define_method :"convert_hashtag#{attr}" do |tag|
        @tags << tag.downcase unless @tags.include? tag.downcase
        sym = case attr
              when "" then ""
              else "#"
              end
      %(<a href="../tag/#{tag}/" class="hashtag">##{tag+sym}</a>)
      end
    end
  end
end
