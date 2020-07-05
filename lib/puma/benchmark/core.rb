require 'open3'
require 'pp'
require 'puma/benchmark/print_result'

module Puma
  module Benchmark
    class Core
      def initialize(params)
        @base_url = params[:base_url] || 'http://localhost:3000'
        @api = params[:api]
        @max_threads = params[:threads] || 5
        @max_workers = params[:max_workers] || 4
        @result = []
      end

      def current_dir
        File.expand_path(File.dirname('.'))
      end

      def pid_file
        "#{current_dir}/tmp/pids/server.pid"
      end

      def run
        @max_workers.times do |worker_count|
          @max_threads.times do |thread_count|
            process(worker_count + 1, thread_count + 1)
          end
        end
        Puma::Benchmark::PrintResult.new.call(@result)
      end

      def process(worker_count, thread_count)
        if !File.exist?(pid_file)
          fork {
            system("RAILS_ENV=production puma -w #{worker_count} -t #{thread_count}")
          }
          sleep(5)
        end

        print_timer
        stdout, stderr, status = Open3.capture3("wrk -t 2 -c 100 -d 30s  #{@base_url}/#{@api}")
        pp stdout

        #p "Requests / sec: #{stdout.split(' ')[-3]}"
        req_per_sec = stdout.split(' ')[-3]
        @result << {workers: worker_count.to_s, threads: thread_count.to_s, req_per_sec: req_per_sec}
        system("kill #{File.read(pid_file)}")
        sleep(5)
      end

      def print_timer
        fork{
          p 'Sending request for 30 secs'
          30.times do |n|
            print "    #{30 - n} sec left \r"
            $stdout.flush
            sleep(1)
          end
        }
      end
    end
  end
end