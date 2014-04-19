require 'nokogiri'

class XMLFileRenamer
  attr_reader :source_data, :css_selector, :xml_document,
      :origin_directory, :export_directory,
      :new_file_name, :destination_file_name

  def initialize(source_data, css_selector)
    @source_data = source_data
    @css_selector = css_selector
  end

  def rename
    set_origin_directory
    print_origin_directory
    set_export_directory
    print_export_directory
    print_css_selector

    if (!File.directory? @source_data) && (File.exist? @source_data)
      open_xml_file
      query_xml_file
      export_xml_file
    end

    if File.directory? @source_data
      Dir.chdir(@source_data) do
        all_regular_files_in_directory = Dir.glob('*.*')
        all_regular_files_in_directory.each do |file_name|
          xml_file_renamer = XMLFileRenamer.new(file_name, @css_selector)
          xml_file_renamer.rename
        end
      end
    end
  end

  private
    def set_origin_directory
      @origin_directory = Dir.pwd
    end

    def print_origin_directory
      puts '**** Origin Directory: ' + @origin_directory
    end

    def print_css_selector
      puts '**** CSS selector: ' + @css_selector
    end

    def set_export_directory
      # Specify export directory:
      @export_directory = @origin_directory + '/export_folder'
    end

    def print_export_directory
      puts '**** Export Directory: ' + @export_directory
    end

    def open_xml_file
      # Read in the file and get new file name:
      puts '**** Source File: ' + @source_data
      @xml_document = Nokogiri::XML(open(@source_data))
    end

    def query_xml_file
      xml_query_by_css = @xml_document.css(@css_selector)

      @new_file_name = xml_query_by_css.text.strip
      puts '**** New File Name: ' + @new_file_name
    end

    #This method should be split into making a directory and exporting a file
    def export_xml_file
      @destination_file_name = @export_directory + '/' + @new_file_name.to_s + '.xml'

      FileUtils.mkdir_p @export_directory
      FileUtils.copy_file(@source_data, @destination_file_name)
    end
end


# Checkout the public repo at:
# https://github.com/sealocal/xml_file_renamer
