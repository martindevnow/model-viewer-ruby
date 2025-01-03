class CrawlDesignsJob < ApplicationJob
  queue_as :default

  def crawl_folder(folder) 
    # get a list of files in the folder
    @files = Dir[folder + "/*"]

    # iterate through the list of files and crawl each one
    @files.each do |file|

      # run the crawl_folder method recursively if the file is a folder
      if File.directory?(file)
        crawl_folder(file)
        next
      end

      # abort if file is not a .zip, .stl, or .obj file
      if ![".zip", ".stl", ".obj"].include? File.extname(file)
        puts "Skipping file: " + file
        STDOUT.flush
        next
      end

      # get the file name
      @file_name = File.basename(file)

      # get the full path
      @full_path = file

      # log file info for debugging
      puts "File: " + @file_name
      Rails.logger.debug "Folder: " + folder
      Rails.logger.debug "Full Path: " + @full_path
      STDOUT.flush

      # create a new design record
      @design = Design.new(name: @file_name, folder: folder, file_name: @file_name, full_path: @full_path)

      # save the design record
      @design.save
    end
  end

  def perform(*args)
    # get a list of folders in the /models directory
    @dir = Dir.pwd
    @models_dir = @dir + "/models"
    crawl_folder(@dir + "/models/" + @models_dir)

  end
end
