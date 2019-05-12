module Rubydiff
  class Diff
    def initialize(first_file, second_file)
      @first_file = first_file
      @second_file = second_file
    end

    def lines
      @lines ||= []
    end

    def build_line(value, state)
      lines << Line.new(value, state, lines.length)
      state
    end

    def compare
      each_compare_lines do |left, right|
        if left == right
          build_line(left, :unchanged)
        elsif left.nil? && !right.nil?
          build_line(right, :added)
        elsif right.nil?
          build_line(left, :deleted)
        else
          compare_changed(left, right)
        end
      end
    end

    def output
      Rubydiff::Format::Text.new(lines).format
    end

    private

    def left_lines
      @left_lines ||= @first_file.lines.dup
    end

    def right_lines
      @right_lines ||= @second_file.lines.dup
    end

    def total_lines_count
      left_lines.length + right_lines.length
    end

    def each_compare_lines
      while total_lines_count > 0
        left = left_lines.shift
        right = right_lines.shift

        result = yield(left, right)

        right_lines.unshift(right) if !right.nil? && result == :deleted
      end
    end

    def compare_changed(left, right)
      if right_lines.include?(left)
        build_line(right, :added)
      elsif left_lines.include?(right)
        build_line(left, :deleted)
      else
        build_line(left + '|' + right, :changed)
      end
    end
  end
end
