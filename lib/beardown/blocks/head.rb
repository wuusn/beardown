module Beardown
  class Document
    REGEXP_HEAD = /^(\#{1,6})\s+(.+)(\n)?/

    def scan_head(s)
      id = s[1].length
      content = s[2]
      render_head id, content
      convert_head id, content
    end

    def render_head(id, content)
      @title << content if id==1&&@title.empty?
    end

    def convert_head(id,content)
      "<h#{id}>#{content}</h#{id}>\n"
    end
  end
end
