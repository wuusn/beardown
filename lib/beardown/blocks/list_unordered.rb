REGEXP_LIST_UNORDERED = /((^\t*\*\s+)(.+)(\n)?)+/
REGEXP_LIST_UNORDERED_SUBLINE = /^(\t*)\*\s+(.+)\n?/
def scan_list_unordered(s)
  convert_list_unordered(StringScanner.new(s[0]))
end

def convert_list_unordered(s)
  indentation = -1
  subs = -1;
  res = String.new
  while !s.eos? do
    s.scan REGEXP_LIST_UNORDERED_SUBLINE
    t_count = s[1].length
    content = s[2]

    d = t_count - indentation
    res << case
           when d > 0 then "<ul><li>"
           when d == 0 then "</li><li>"
           when d < 0 then "</li></ul>" * d.abs + "<li>"
           end

    indentation = t_count
    res << scan_spans(StringScanner.new(content))
  end
  res << "</li></ul>\n"
end
