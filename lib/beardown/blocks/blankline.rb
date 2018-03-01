module Beardown
  class Document
    REGEXP_BLANKLINE = /^\n+/

    def scan_blankline(s)
      len = s[0].length
      convert_blankline len
    end

    def convert_blankline(len)
      "<br>" * len + "\n"
    end
  end
end
