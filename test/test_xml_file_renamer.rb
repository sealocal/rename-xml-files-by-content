require 'minitest/autorun'
require 'xml_file_renamer'

class XMLFileRenamerTest < Minitest::Test

  def test_new_xfr
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    xfr = XMLFileRenamer.new(source_data, tag_names)
    assert_equal './example_xml_files/example_building_589990.xml', xfr.source_data
    assert_equal 'building Contact building_name', xfr.tag_names
  end

  def test_print_origin_directory
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    xfr = XMLFileRenamer.new(source_data, tag_names)
    assert_equal '/Users/Home/ruby_projects/xml_file_renamer/example_xml_files', xfr.print_origin_directory
  end

  def test_print_export_directory
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    xfr = XMLFileRenamer.new(source_data, tag_names)
    assert_equal '/Users/Home/ruby_projects/xml_file_renamer/example_xml_files/export_folder', xfr.print_export_directory
  end

  def test_print_tag_names
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    xfr = XMLFileRenamer.new(source_data, tag_names)
    assert_equal 'building Contact building_name', xfr.print_tag_names
  end

  def test_print_case_option_is_lower_case
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    case_option = 'lower_case'
    xfr = XMLFileRenamer.new(source_data, tag_names, case_option)
    assert_equal 'lower_case', xfr.print_case_option
  end

  def test_print_case_option_is_upper_case
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    case_option = 'upper_case'
    xfr = XMLFileRenamer.new(source_data, tag_names, case_option)
    assert_equal 'upper_case', xfr.print_case_option
  end

  def test_rename_single_file
    source_data = './example_xml_files/example_building_589990.xml'
    tag_names = 'building Contact building_name'
    xfr = XMLFileRenamer.new(source_data, tag_names)
    assert_equal 'Space Needle', xfr.rename
  end

  def test_rename_directory_of_files
    source_data = './example_xml_files'
    tag_names = 'building Contact building_name'
    xfr = XMLFileRenamer.new(source_data, tag_names)
    assert_equal ['Columbia Center', 'Space Needle', 'Premiere on Pine'], xfr.rename
  end

end
