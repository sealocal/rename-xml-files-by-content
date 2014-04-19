#xml_file_renamer

This is a Ruby class that allows you to rename your XML files based on content inside the file.


##Use Case Scenario:

####You have multiple files named like:

    building_589989.xml, building_589990.xml, building_589991.xml

####You want the files to be named:

    Columbia Tower.xml, Space Needle.xml, Premiere on Pine.xml

####Where `"Columbia Tower"` is a text node, that you can locate with a CSS selector:

    'building Contact building_name'


##Solution:

###Install:

  Install the gem from rubygems.org

    $ gem install xml_file_renamer

###Run the command:

	$ xml_file_renamer '<source_data>' '<css_selector>'

###Examples:

  Copy example XML files provided by the gem:

    $ cp -r `which xml_file_renamer`/../../gems/xml_file_renamer-0.0.3/example_xml_files ~/Documents/example_xml_files

  Run the command on a single file:

    $ xml_file_renamer \
    ~/Documents/example_xml_files/example_building_589989.xml \
    'building Contact building_name'

  Output:

    **** Origin Directory: /Users/sealocal/Documents/world_buildings
    **** Export Directory: /Users/sealocal/Documents/world_buildings/export_folder
    **** CSS selector: building Contact building_name
    **** Source File: example_building_589989.xml
    **** New File Name: Columbia Tower

  Instead of a single file, run the command on a directory:

    $ xml_file_renamer ~/Documents/example_xml_files 'building Contact building_name'

  Output:

    **** Origin Directory: /Users/Home/Documents/example_xml_files
    **** Export Directory: /Users/Home/Documents/example_xml_files/export_folder
    **** CSS selector: building Contact building_name
    **** Origin Directory: /Users/Home/Documents/example_xml_files
    **** Export Directory: /Users/Home/Documents/example_xml_files/export_folder
    **** CSS selector: building Contact building_name
    **** Source File: example_building_589989.xml
    **** New File Name: Columbia Center
    **** Origin Directory: /Users/Home/Documents/example_xml_files
    **** Export Directory: /Users/Home/Documents/example_xml_files/export_folder
    **** CSS selector: building Contact building_name
    **** Source File: example_building_589990.xml
    **** New File Name: Space Needle
    **** Origin Directory: /Users/Home/Documents/example_xml_files
    **** Export Directory: /Users/Home/Documents/example_xml_files/export_folder
    **** CSS selector: building Contact building_name
    **** Source File: example_building_589991.xml
    **** New File Name: Premier on Pine


####Notes:

  1. <source_data> must contain an XML tree, with a match for your CSS selector.

  2. <source_data> can have ANY file extension, as long as it HAS a file extension.

  3. <source_data> can be a relative or absolute path to an XML file.

  4. The output will be saved to an `export_folder`, until this project is otherwise updated.


##Contribute:
Please STAR, [FORK](https://github.com/sealocal/xml_file_renamer/fork), or create a new [ISSUE](https://github.com/sealocal/xml_file_renamer/issues/new) if you would like to see this project developed further. We can even rename the project when appropriate!
