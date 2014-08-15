Gem::Specification.new do |s|
  s.name         =  'xml_file_renamer'
  s.version      =  '0.0.9'
  s.add_runtime_dependency "nokogiri", ["= 1.6.1"]
  s.executables  << 'xml_file_renamer'
  s.date         =  '2014-08-14'
  s.summary      =  "Batch rename XML files - rule the world!"
  s.description  =  "A command line executable for renaming XML files to content of an XML tag."
  s.authors      =  ["Mike Taylor"]
  s.email        =  'local.mat@gmail.com'
  s.files        =  Dir["bin/*", "{example_xml_files}/*.xml", "{lib}/**/*.rb",
                    "LICENSE", "README.md"]
  s.homepage     =  'https://github.com/sealocal/xml_file_renamer'
  s.license      =  'MIT'
end
