REGEXP_QUOTE = /^>\s+(.+)\n?/

def scan_quote(s)
  content = s[1]
  convert_quote(content)
end

def convert_quote(content)
  "<blockquote>#{scan_spans(content)}</blockquote>\n"
end
