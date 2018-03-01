module Beardown
  class Document
    REGEXP_LIST_UNORDERED = /^(\t*) *\*\s+(.+)(\n)?/
    def scan_list_unordered(s)
      t_count = s[1].length
      content = s[2]
      convert_list_unordered(t_count, content)
    end

    def convert_list_unordered(t_count, content)
      "<ul>" * t_count + "<ul><li>" + scan_spans(StringScanner.new(content)) + "</li></ul>" + "</ul>" * t_count + "\n"
    end
  end
end
