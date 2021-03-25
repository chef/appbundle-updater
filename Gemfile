source "https://rubygems.org"

gemspec

group :docs do
  gem "yard"
  gem "redcarpet"
  gem "github-markup"
end

group :test do
  gem "parallel", "< 1.20" # remove this pin/dep when we drop ruby < 2.4
  gem "chefstyle", "1.7.4"
  gem "rake"
end

group :debug do
  gem "pry"
  gem "pry-byebug"
  gem "pry-stack_explorer"
end
