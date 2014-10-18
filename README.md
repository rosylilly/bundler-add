# Bundler::Add

This gem provides `bundle add` command.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bundler-add'
```

## Usage

```
$ bundle add rails rspec-rails
gem 'rails', '~> 4.1.6'
gem 'rspec-rails', '~> 3.1.0'
$ bundle add rails rspec-rails >> Gemfile
$ bundle add rspec -g test,development
gem 'rspec', '~> 3.1.0', group: [:test, :development]
```

## Contributing

1. Fork it ( https://github.com/rosylilly/bundler-add/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
