START_CHAR_BOLD = "*"
START_CHAR_ITALIC = "/"
START_CHAR_UNDERLINE = "_"
START_CHAR_STRIKE = "-"

REGEXP_BOLD = /\*(.+)\*/
REGEXP_ITALIC = /\/(.+)\//
REGEXP_UNDERLINE = /\_(.+)\_/
REGEXP_STRIKE = /\-(.+)\-/

["bold", "italic", "underline", "strike"].each do |attr|
  define_method :"scan_#{attr}" do |s|
    content = s[1]
    send "convert_#{attr}", content
  end

  define_method :"convert_#{attr}" do |content|
    tag = attr[0]
    %(<#{tag}>#{scan_spans(StringScanner.new(content))}</#{tag}>)
  end
end
