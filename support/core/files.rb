def insert_in_file_after_line(file, after_line, &block)
  inject_into_class(file, after_line, block)
end
