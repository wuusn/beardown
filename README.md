# Beardown

A html convertor for [Bear](http://www.bear-writer.com) App's bearnote - [Polar Bear markup language](http://www.bear-writer.com/faq/Markup%20:%20Markdown/Polar%20Bear%20markup%20language/) inspired by CommonMark, and this convertor used by [Miyano](https://github.com/wuusn/miyano)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beardown'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beardown

## Usage

```ruby
require "beardown"

text = File.read "text.txt"
note = Beardown.new text

note.html
note.title
note.content
note.summary
note.tags

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wuusn/beardown.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
