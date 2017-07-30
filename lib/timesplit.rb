require 'timesplit/version'
require 'timesplit/split'

module Timesplit
end

Split = Timesplit::Split
def Split(*args)
  Timesplit::Split.new(*args)
end
