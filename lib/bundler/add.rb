require 'thor'
require 'open-uri'
require 'json'
require 'optparse'
require 'bundler/add/version'

module Bundler
  module Add
    class << self
      def show_defines(argv)
        options = parse_options(argv)

        options[:gems].each do |gem|
          show_define(gem, options)
        end
      end

      def show_define(gem, options)
        if options[:groups].any?
          groups = options[:groups]
          puts %Q{gem '#{gem}', '~> #{fetch_version(gem)}', group: [#{groups.map{|g| g.sub(/^/, ':') }.join(', ')}]}
        else
          puts %Q{gem '#{gem}', '~> #{fetch_version(gem)}'}
        end
      end

      def fetch_version(gem)
        gemspec = JSON.parse(open("https://rubygems.org/api/v1/gems/#{gem}.json", &:read))

        gemspec['version']
      rescue OpenURI::HTTPError
        '0.0.0'
      end

      def parse_options(argv)
        groups = []
        req = nil

        opts = OptionParser.new
        opts.on('-g GROUP', '--group GROUP', Array) do |group|
          groups = group
        end
        gems = opts.parse!(argv)

        {
          gems: gems,
          groups: groups
        }
      end
    end
  end
end
