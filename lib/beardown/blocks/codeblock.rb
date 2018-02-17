REGEXP_CODEBLOCK = /^```\n((.+\n)*)^```\n?/

def scan_codeblock(s)
  content = s[1]
  convert_codeblock(content)
end

def convert_codeblock(content)
  %(<pre><code class="code-multiline">#{content}</code></pre>\n)
end
