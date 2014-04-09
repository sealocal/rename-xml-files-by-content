#rename_XML_files_by_content

This is a Ruby script that allows you to rename your XML files based on content inside the file.


##Use Case Scenario:

You have multiple files named like:

    building_589989.xml, building_589990.xml, building_589991.xml

You want the files to be named:
	
    Columbia Tower.xml, Space Needle.xml, Premiere on Pine.xml

Where `"Columbia Tower"` is a text node, that you can locate with a CSS selector:

    'building Contact alt_building_name'


##Solution:

Run the script:

	$ruby rename_xml_files_by_content.rb '<source_data.xml' '<css_selector>'

Example:

    $ ruby rename_xml_files_by_content.rb \ 
    '/Users/sealocal/Documents/world_buildings/building_589989.xml' \
    'building Contact alt_building_name' 
