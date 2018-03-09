$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "beardown"
require "minitest/autorun"
def parse(text)
  Beardown.new(text).to_html
end

def filetest(file_pre)
  dir = File.dirname(__FILE__) + "/examples"
  input = File.open("#{dir}/#{file_pre}.txt").read
  output = File.open("#{dir}/#{file_pre}.html").read
  assert_equal  parse(input), output
end

def output_file(text)
  dir = File.dirname(__FILE__) + "/examples"
  File.open("#{dir}/output.html", "w") {|f| f.write(text)}
end
