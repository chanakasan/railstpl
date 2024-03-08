module Helpers
  def do_bundle
    # Custom bundle command ensures dependencies are correctly installed
    Bundler.with_unbundled_env { run "bundle install" }
  end
end