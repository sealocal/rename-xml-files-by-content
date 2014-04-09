require 'nokogiri'
require 'open-uri'
require 'fileutils'

# Read in the file and get new file name:
source_xml_file = ARGV[0]
puts '**** XML File: ' + source_xml_file

origin_directory = File.dirname(source_xml_file)
puts '**** Origin Directory: ' + origin_directory

doc = Nokogiri::XML(open(source_xml_file))

css_selector = ARGV[1]
xml_query = doc.css(css_selector)
puts '**** XML Query by CSS: ' + xml_query.text.strip

new_file_name = xml_query.text.strip
puts '**** New File Name: ' + new_file_name

# Specify export directory:
export_directory = origin_directory + '/export_folder'
puts '**** Export Directory: ' + export_directory

destination_file = export_directory + '/' + new_file_name.to_s + '.xml'

FileUtils.mkdir_p export_directory
FileUtils.copy_file(source_xml_file, destination_file)
