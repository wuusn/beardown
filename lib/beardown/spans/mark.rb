START_CHAR_MARK = ":"
REGEXP_MARK = /::([^\s].*[^\s])::/
REGEXP_MARK_NOSPACE = /::([^\s]*)::/

["", "_nospace"].each do |attr|
  define_method :"scan_mark#{attr}" do |s|
    content = s[1]
    send "convert_mark#{attr}", content
  end

  define_method :"convert_mark#{attr}" do |content|
    %(<mark>#{scan_spans(StringScanner.new(content))}</mark>)
  end
end
