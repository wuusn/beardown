require "test_helper"

class BeardownTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Beardown::VERSION
  end

  def test_it_does_something_useful
    assert true
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
    filetest "ulist1"
  end

  def test_list_ordered
    filetest "olist1"
  end

  def test_list_todo
    filetest "todolist1"
    #input = File.read "test/examples/todolist1.txt"
    #output_file parse input
  end

  def test_quote
    filetest "quote1"
  end

  def test_codeblock
    #filetest "codeblock1"
    #filetest "codeblock2"
  end

  def test_asset
    filetest "asset1"
  end

  def test_blankline
    filetest "blankline1"
    #input = "list1\n\n\n* list1"
    #output_file(parse(input))
  end

  def test_p
    filetest "p1"
    filetest "p2"
  end

  def test_mix_h1_and_ulist
    input = "* list1\n# head1"
    #output_file(parse(input))
    output = "<ul><li>list1</li></ul>\n<h1>head1</h1>\n"
    assert_equal parse(input), output
  end

  def test_codespan
    filetest "codespan1"
  end

  def test_hashtag_full
    filetest "hashtag_full1"
    assert_equal parse("#d#"), %(<p><a href="../tag/d/" class="hashtag">#d#</a></p>\n)
    assert_equal parse("c#,"), %(<p>c#,</p>\n)
    assert_equal parse("#tag1/tag2"), %(<p><a href="../tag/tag1/tag2/" class="hashtag">#tag1/tag2</a></p>\n)
    assert_equal parse("#碎碎念"), %(<p><a href="../tag/碎碎念/" class="hashtag">#碎碎念</a></p>\n)
    #assert_equal parse("#d##"),%()
  end

  def test_render_tag
    bear = Beardown.new "#tag1/tag2/tag3"
    assert_equal bear.tags, ["tag1", "tag1/tag2", "tag1/tag2/tag3"]
  end

  def test_bold_italic_underline
    assert_equal parse("/test/"), "<p><i>test</i></p>\n"
    assert_equal parse("_/*test*/_"), "<p><u><i><b>test</b></i></u></p>\n"
  end

  def test_linkpost
    assert_equal parse("123[[Beardown]]456"),
      %(<p>123<a href="../Beardown/">Beardown</a>456</p>\n)
  end

  def test_linkurl
    filetest "linkurl1"
  end

  def test_mark
    filetest "mark1"
  end

  def test_mix_file
    dir = File.dirname(__FILE__) + "/examples"
    #input = File.open("#{dir}/text2.txt").read
    #output_file(parse(input))
  end

  def test_html_entities
    assert_equal parse("13 > 12"), "<p>13 &gt 12</p>\n"
  end

  def test_tag_hashcolor
    assert_equal parse("#abcdfF"), %(<p><span class='color-preview' style='background-color:#abcdfF'></span><span class='color-code'><span class='color-hash'>#</span>abcdfF</span></span></p>\n)
  end

end
