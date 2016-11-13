# A sample Guardfile
# More info at https://github.com/guard/guard#readme

rubocop_options = {
  all_on_start: false,
  cli: %w[-c .rubocop.yml -D]
}

guard :rubocop, rubocop_options do
  watch(%r{.+\.rb$})
end
