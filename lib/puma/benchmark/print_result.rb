module Puma
  module Benchmark
    class PrintResult
      def call(result)
        set_columns
        write_divider
        write_header
        write_divider
        result.each { |h| write_line(h) }
        write_divider
      end

      def set_columns
        @columns = {workers: {:label=>"No. of workers",    :width=>15},
                    threads: {:label=>"No. of threads",    :width=>15},
                    req_per_sec: {:label=>"No. of requests/sec",    :width=>20}}
      end

      def write_header
        puts "| #{ @columns.map { |_,g| g[:label].ljust(g[:width]) }.join(' | ') } |"
      end

      def write_divider
        puts "+-#{ @columns.map { |_,g| "-"*g[:width] }.join("-+-") }-+"
      end

      def write_line(h)
        str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join(" | ")
        puts "| #{str} |"
      end
    end
  end
end