# Puma::Benchmark

This gem will help in setting right number of workers and threads for your application.

## Installation

This gem uses `wrk` for benchmarking, therefore you should first install `wrk` on your machine.
For Mac: https://github.com/wg/wrk/wiki/Installing-wrk-on-Mac-OS-X
For Linux: https://github.com/wg/wrk/wiki/Installing-wrk-on-Linux

Install gem by command:

    $ gem install puma-benchmark

## Usage

Usage: puma-benchmark [options]

    -b, --base_url [BASE_URL]        Application base url for
                       benchmarking, default: http://localhost:3000

    -a, --api API                    API for benchmarking, example: /homes.json

    -e, --environment                default: production

    -t, --threads [Max Thread]       Max thread to be used per worker, default: 4

    -w, --workers [Max Worker]       Max worker to be used for benchmarking, default: 4

    -d, --duration [Duration]        Duration for each test (in seconds), default: 30

    -h, --help                       Prints this help

## Result

![result](https://raw.githubusercontent.com/anilmaurya/puma-benchmark/master/puma-benchmark-result.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anilmaurya/puma-benchmark. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Puma::Benchmark project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/anilmaurya/puma-benchmark/blob/master/CODE_OF_CONDUCT.md).
