module Beardown
  class Document
    START_CHAR_CODESPAN = "`"
    REGEXP_CODESPAN = /`(.*?)`/

    def scan_codespan(s)
      code = s[1]
      convert_codespan code
    end

    def convert_codespan(code)
      %(<code class="code-inline">#{code}</code>)
    end
  end
end
