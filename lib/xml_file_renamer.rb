require 'nokogiri'

class XMLFileRenamer
  attr_reader :source_data, :css_selector, :xml_document,
      :origin_directory, :export_directory,
      :new_file_name, :destination_file_name

  def initialize(source_data, css_selector)
    @source_data = source_data
    @css_selector = css_selector

    set_origin_directory
    set_export_directory
  end

  def print_origin_directory
    puts '**** Origin Directory: ' + origin_directory
    origin_directory
  end

  def print_export_directory
    puts '**** Export Directory: ' + export_directory
    export_directory
  end

  def print_css_selector
    puts '**** CSS selector: ' + css_selector
    css_selector
  end

  def rename
    new_file = if (!File.directory? source_data) && (File.exist? source_data)
      open_xml_file
      query_xml_file
      export_xml_file
    end

    if File.directory? source_data
      new_files = []
      Dir.chdir(source_data) do
        all_regular_files_in_directory = Dir.glob('*.*')
        all_regular_files_in_directory.each do |file_name|
          xml_file_renamer = XMLFileRenamer.new(file_name, css_selector)
          new_files << xml_file_renamer.rename
        end
      end
    end

    new_file || new_files
  end

  private
    def set_origin_directory
      if (!File.directory? source_data) && (File.exist? source_data)
        @origin_directory = File.expand_path(File.dirname(source_data))
      end

      if File.directory? source_data
        @origin_directory = source_data
      end
    end

    def set_export_directory
      # Specify export directory:
      @export_directory = origin_directory + '/export_folder'
    end

    def open_xml_file
      # Read in the file and get new file name:
      puts '**** Source File: ' + File.expand_path(source_data).split('/')[-1]
      @xml_document = Nokogiri::XML(open(source_data))
    end

    def query_xml_file
      xml_query_by_css = xml_document.css(css_selector)

      @new_file_name = xml_query_by_css.text.strip
      puts '**** New File Name: ' + new_file_name
    end

    #This method should be split into making a directory and exporting a file
    def export_xml_file
      @destination_file_name = export_directory + '/' + new_file_name.to_s + '.xml'

      FileUtils.mkdir_p export_directory
      FileUtils.copy_file(source_data, destination_file_name)
      new_file_name
    end
end


# Checkout the public repo at:
# https://github.com/sealocal/xml_file_renamer
