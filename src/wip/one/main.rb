source_paths << File.expand_path(__dir__)

copy_file "tailwind/tailwind.config.js", "tailwind.config.js"
run "echo done"