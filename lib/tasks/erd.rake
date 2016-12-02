desc 'Generate Entity Relationship Diagram'
task :generate_erd do
  system "erd --inheritance --filetype=png --direct --attributes=foreign_keys,primary_keys,inheritance,content"
end