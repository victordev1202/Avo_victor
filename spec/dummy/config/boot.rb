# Set up gems listed in the Gemfile.
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../../Gemfile", __dir__)

ENV["AVO_IN_DEVELOPMENT"] = "1"

require "bundler/setup" if File.exist?(ENV["BUNDLE_GEMFILE"])
require "bootsnap/setup" unless ENV["CI"] # Speed up boot time by caching expensive operations.
$LOAD_PATH.unshift File.expand_path("../../../lib", __dir__)
