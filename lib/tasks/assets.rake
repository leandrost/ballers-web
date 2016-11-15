# These tasks run as pre-requisites of assets:precompile.
# # Note, it's not possible to refer to ReactOnRails configuration values at this point.
Rake::Task["assets:precompile"]
  .clear_prerequisites
  .enhance do
  sh "yarn run build:production"
  Rake::Task["react_on_rails:assets:symlink_non_digested_assets"].invoke
  Rake::Task["react_on_rails:assets:delete_broken_symlinks"].invoke
end
