# Rubydiff

Ruby gem that can compare the content of two files.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubydiff', git: 'git://github.com/rikko999/rubydiff.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubydiff

## Usage

```ruby
first_file = File.read('/some/path/file_1.txt')
second_file = File.read('/some/path/file_2.txt')

diff = RubyDiff::Diff.new(first_file, second_file)
diff.compare
puts diff.output

1 * Some|Another
2 - Simple
3   Text
4   File
5 + With
6 + Additional
7 + Lines
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rikko999/rubydiff.
