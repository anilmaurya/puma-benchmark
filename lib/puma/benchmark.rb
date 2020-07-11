require "puma/benchmark/version"
#require "puma/benchmark/config"
require "puma/benchmark/core"
require 'optparse'
require 'optparse/uri'

module Puma
  module Benchmark
    class Error < StandardError; end
    
    def self.run(params)
      if params[:api]
        Puma::Benchmark::Core.new(params).run
      else
        puts "API parameter is mandatory, try puma-benchmark -h"
      end
    end

    def self.parse(options)
      params = {}
      opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: puma-benchmark [options]"

        opts.on("-b", "--base_url [BASE_URL]", URI,  "Application base url for
                       benchmarking, default: http://localhost:3000")

        opts.on("-a", "--api API", "API for benchmarking, example: /homes.json")

        opts.on("-e", "--environment", "default: production")
        
        opts.on("-t", "--threads [Max Thread]", "Max thread to be used per worker, default: 4")

        opts.on("-w", "--workers [Max Worker]", "Max worker to be used for benchmarking, default: 4")

        opts.on("-d", "--duration [Duration]", "Duration for each test (in seconds), default: 30")

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end.parse!(into: params)

      run(params)
    end
  end
end
