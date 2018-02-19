REGEXP_P = /^(.+)\n?/

def scan_p(s)
  content = s[1]
  convert_p content
end

def convert_p(content)
  "<p>#{scan_spans(StringScanner.new(content))}</p>\n"
end
