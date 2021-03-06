# Timesplit 🏃🏻

[![Gem Version](https://badge.fury.io/rb/timesplit.svg)](https://badge.fury.io/rb/timesplit)
[![Coverage Status](https://coveralls.io/repos/github/SleepingInsomniac/timesplit/badge.svg?branch=master)](https://coveralls.io/github/SleepingInsomniac/timesplit?branch=master)
[![Download Count](http://ruby-gem-downloads-badge.herokuapp.com/timesplit)](http://ruby-gem-downloads-badge.herokuapp.com/timesplit)

```ruby
Split(4,0).to_s # => '00:04:00'

%w[
  4:04
  3:48
  4:12
  4:01
  3:46
].map { |t| Split(t) }.reduce(&:+).to_s # => '00:19:51'
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'timesplit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install timesplit

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sleepinginsomniac/timesplit.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
