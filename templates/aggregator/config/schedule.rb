require File.join AggregationPlatform.root, 'config/schedule.rb'
require 'aggregation-platform/path'
config = File.join AggregationPlatform.root, 'config/schedule.rb'

eval File.open(config).read
