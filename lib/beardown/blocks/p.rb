module Beardown
  class Document
    REGEXP_P = /^(\s*)(.+)\n?/

    def scan_p(s)
      indent = s[1].length
      content = s[2]
      convert_p indent, content
    end

    def convert_p(indent, content)
      "<p>#{"&emsp;"*indent}#{scan_spans(StringScanner.new(content))}</p>\n"
    end
  end
end
