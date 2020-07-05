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

        opts.on("-b", "--base_url [BASE_URL]", URI,  "Application base url for benchmarking")

        opts.on("-a", "--api API", "API for benchmarking")
        
        opts.on("-t", "--threads [Max Thread]", "Max thread to be used per worker")

        opts.on("-w", "--workers [Max Worker]", "Max worker to be used for benchmarking")

        opts.on("-h", "--help", "Prints this help") do
          puts opts
          exit
        end
      end.parse!(into: params)

      run(params)
    end
  end
end
