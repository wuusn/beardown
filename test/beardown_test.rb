require "test_helper"

class BeardownTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Beardown::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def parse(doc)
    Beardown.new(doc).to_html
  end

  def test_headings
    assert_equal parse("# Beardown Test"), "<h1>Beardown Test</h1>"
    assert_equal parse("## Heading 2"), "<h2>Heading 2</h2>"
    assert_equal parse("### Heading 3"), "<h3>Heading 3</h3>"
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
