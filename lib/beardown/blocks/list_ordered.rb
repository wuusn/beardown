module Beardown
  class Document
    REGEXP_LIST_ORDERED = /^(\t*) *(\d+)\.\s+(.+)\n?/
    def scan_list_ordered(s)
      t_count = s[1].length
      start_num = s[2].to_i
      content = s[3]
      convert_list_ordered(t_count, start_num, content)
    end

    def convert_list_ordered(t_count, start_num, content)
      "<ol>" * t_count + %(<ol start="#{start_num}"><li>) + scan_spans(StringScanner.new(content)) + "</li></ol>" + "</ol>" * t_count + "\n"
    end
  end
end
