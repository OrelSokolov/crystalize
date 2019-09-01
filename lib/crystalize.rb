require "crystalize/version"

Dir['lib/**/**/*.rb'].each { |file| require file[4...-3] }

require 'crystalize/check/literals'
require 'crystalize/check/meta'
