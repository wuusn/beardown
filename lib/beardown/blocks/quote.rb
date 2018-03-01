module Beardown
  class Document
    REGEXP_QUOTE = /^>\s+(.+)\n?/

    def scan_quote(s)
      content = s[1]
      convert_quote(content)
    end

    def convert_quote(content)
      "<blockquote>#{scan_spans(StringScanner.new(content))}</blockquote>\n"
    end
  end
end
