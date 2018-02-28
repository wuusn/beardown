REGEXP_CODEBLOCK = /^```(.*)\n((.*\n)*)^```\n?/

def scan_codeblock(s)
  style = case s[1]
          when "" then "multiline"
          else s[1].strip
          end
  content = s[2]
  convert_codeblock(content,style)
end

def convert_codeblock(content, style)
  %(<pre><code class="code-#{style}">#{content}</code></pre>\n)
end
