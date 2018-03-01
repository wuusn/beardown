module Beardown
  class Document
    REGEXP_LINE_SEPARATOR = /^---(\n)?/

    def scan_line_separator(s)
      "<hr>\n"
    end
  end
end
