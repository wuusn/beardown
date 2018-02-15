require "test_helper"

class BeardownTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Beardown::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def parse(text)
    Beardown.new(text).to_html
  end

  def filetest(file_pre)
    dir = File.dirname(__FILE__) + "/examples"
    input = File.open("#{dir}/#{file_pre}.txt").read
    output = File.open("#{dir}/#{file_pre}.html").read
    assert_equal  parse(input), output
  end

  def test_headings
    assert_equal parse("# Beardown Test"), "<h1>Beardown Test</h1>\n"
    assert_equal parse("## Heading 2\n"), "<h2>Heading 2</h2>\n"
    assert_equal parse("### Heading 3"), "<h3>Heading 3</h3>\n"
    assert_equal parse("# H1\n# H1"), "<h1>H1</h1>\n<h1>H1</h1>\n"
  end

  def test_line_separator
    assert_equal parse("---\n"), "<hr>\n"
  end

  def test_list_unordered
    input = "* list1\n\t* list2\n\t* list2\n* list1"
    output = "<ul><li>list1<ul><li>list2</li><li>list2</li></ul><li>list1</li></ul>\n"
    assert_equal parse(input), output
    #filetest "ul1"
    filetest "ul2"
  end
  def test_bold_italic_underline
    #assert_equal parse("_/*test*/_"), "<p><b><i><u>test</u></i></b></p>"
  end

  def test_bold
  end

  def test_italic
  end

  def test_underline
  end

  def strike
  end

  def test_link
  end

  def test_list
  end

  def test_list_ordered
  end

  def test_quote
  end

end
