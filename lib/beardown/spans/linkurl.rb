# START_CHAR_LINKURL = "[" # duplicate with LINKPOST
REGEXP_LINKURL = /\[(.+)\]\((.+)\)/

def scan_linkurl(s)
  title, url = s[1], s[2]
  convert_linkurl(title, url)
end

def convert_linkurl(title,url)
  %(<a href="#{url}">#{title}</a>)
end
