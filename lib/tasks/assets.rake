Rake::Task["assets:precompile"]
  .enhance do
  sh "yarn run build:production"
end
