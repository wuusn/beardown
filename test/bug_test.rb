require "test_helper"

class BugTest < Minitest::Test
  def test_ut_does_something_useful
    assert true
  end

  def test_blankline_with_space
    assert_equal parse("\t\n\n\n"), "<br>\n<br>\n<br>\n"
  end

  def test_arrow
    assert_equal parse("This -> This -> This"), "<p>This -> This -> This</p>\n"
  end

  def test_greedy_with_bold_italic_underline_strike
    assert_equal parse("*bold* and *bold*"), "<p><b>bold</b> and <b>bold</b></p>\n"
  end
end
