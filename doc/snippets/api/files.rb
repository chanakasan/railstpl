# short syntax
inject_into_file "<file_path>", "<new content>", :before => "<before_text_regex>"

inject_into_class "<file_path>", "<ClassName>" do
  # content to insert at class begin
end

insert_into_file "<file_path>", before: "<before_text>" do
  # content to insert before
end

insert_into_file "<file_path>", after: "<after_text>" do
  # content to insert after
end

insert_into_file "<file_path>" do
  # content to insert at the end of file
end

file "<new_file_name>", <<-STR
  # file contents
STR
