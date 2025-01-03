namespace :crawl do
  desc "TODO"
  task designs: :environment do
    def crawl_folder(folder) 
      puts "Crawling folder: " + folder

      # get a list of files in the folder
      @files = Dir[folder + "/*"]

      puts "Found " + @files.length.to_s + " files"
  
      # iterate through the list of files and crawl each one
      @files.each do |file|
  
        # run the crawl_folder method recursively if the file is a folder
        if File.directory?(file)
          crawl_folder(file)
          next
        end
  
        # abort if file is not a .zip, .stl, or .obj file
        if ![".zip", ".stl", ".obj", ".3mf"].include? File.extname(file)
          puts "Skipping file: " + file
          next
        end
  
        # get the file name
        @file_name = File.basename(file)
  
        # get the full path
        @full_path = file
  
        # log file info for debugging
        puts "File: " + @file_name
        puts ":: Folder: " + folder
        puts ":: Full Path: " + @full_path
  
        # create a new design record
        @design = Design.new(name: @file_name, folder: folder, file_name: @file_name, full_path: @full_path)
  
        # save the design record
        @design.save!
      end
    end
  

    @dir = Dir.pwd
    puts "PWD: " + @dir

    @models_dir = @dir + "/models"
    puts "Models Dir: " + @models_dir

    puts "Crawling designs..."
    crawl_folder(@models_dir)

    # CrawlDesignsJob.perform_now
  end
end
