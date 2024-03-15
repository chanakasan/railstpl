require "rtpl_support"

insert_in_file_after_line "config/application.rb", "Application" do %Q{
    config.generators do |g|
      g.scaffold_stylesheet false
      g.test_framework "none", :fixture => false
      g.helper false
      g.assets false
      g.javascripts false
      g.stylesheets false
      g.skip_routes true
    end

}
end

add_to_commit "config/application.rb*"
commit_changes "script: configure generators"
