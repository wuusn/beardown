module Beardown
  class Document
    REGEXP_BLANKLINE = /^\s*?\n/

    def scan_blankline(s)
      convert_blankline
    end

    def convert_blankline
      "<br>\n"
    end
  end
end
