module Rubydiff
  module Format
    class Text
      def initialize(lines)
        @lines = lines
        @output = ''
      end

      def format
        @lines.each do |line|
          display send("format_#{line.state}", line)
        end

        @output
      end

      def display(value)
        @output << value.tr("\n", '') + "\n"
      end

      def format_deleted(line)
        "#{line.position} - #{line.value}"
      end

      def format_added(line)
        "#{line.position} + #{line.value}"
      end

      def format_changed(line)
        "#{line.position} * #{line.value}"
      end

      def format_unchanged(line)
        "#{line.position}   #{line.value}"
      end
    end
  end
end
