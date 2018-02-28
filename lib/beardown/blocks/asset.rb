REGEXP_ASSET = /^\[assets\/(.+)\]\n?/

def scan_asset(s)
  filename = s[1]
  convert_asset filename
end

def convert_asset(filename)
  if is_img? filename
    return %(<p><img src="assets/#{filename}"></p>\n)
  else
    return %(<p><a href="assets/#{filename}">#{filename}</a></p>\n)
  end
end

def is_img?(filename)
  ext = File.extname filename
  case ext.downcase
  when ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".ico", ".tiff", ".svg", ".apng"
    return true
  else
    return false
  end
end
