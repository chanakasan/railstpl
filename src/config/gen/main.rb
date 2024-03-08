inject_into_class "config/application.rb", "Application" do
  str = <<STR
    config.generators do |g|
      g.scaffold_stylesheet false
      g.test_framework "none", :fixture => false
      g.helper false
      g.assets false
      g.javascripts false
      g.stylesheets false
      g.skip_routes true
    end

STR
  str
end

git add: "config/application.rb*"
git commit: %Q{ -m "script: configure generators" }
