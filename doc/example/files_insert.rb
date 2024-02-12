inject_into_file "config/routes.rb", "root \"pages#home\"\n", :before => /^end/

inject_into_class "config/application.rb", "Application" do
  config.hosts << "example.com"
end