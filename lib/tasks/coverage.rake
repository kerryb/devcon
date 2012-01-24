require "simplecov"

task :check_coverage do
  SimpleCov.coverage_dir "coverage"
  coverage = SimpleCov.result.covered_percent
  fail "Coverage was only #{coverage}%" if coverage < 100.0
end
