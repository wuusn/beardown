START_CHAR_LINKPOST = "["
REGEXP_LINKPOST = /\[\[(.+)\]\]/

# I use this not as a X callback url Scheme
# Instead, A url to this website used in Miyano Blog system

def scan_linkpost(s)
  title = s[1]
  convert_linkpost(title)
end

def convert_linkpost(title)
  %(<a href="../#{title}/">#{title}</a>)
end
