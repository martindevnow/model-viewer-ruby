namespace :crawl do
  desc "TODO"
  task items: :environment do
    @dir = Dir.pwd
    puts "PWD: " + @dir

    @models_dir = @dir + "/models"
    puts "Models Dir: " + @models_dir


    def crawl_folder(folder)
      puts "Crawling folder: " + folder

      # get a list of files in the folder
      @files = Dir[folder + "/*"]

      puts "Found " + @files.length.to_s + " files"

      # iterate through the list of files and crawl each one
      @files.each do |file|
        # run the crawl_folder method recursively if the file is a folder
        if File.directory?(file)
          # TODO: Log the folders too??
          crawl_folder(file)
          next
        end

        # abort if file is not a .zip, .stl, or .obj file
        if ![ ".zip", ".stl", ".obj", ".3mf", ".png", ".jpg", ".jpeg", ".md", ".html", ".htm", ".pdf" ].include? File.extname(file)
          puts "Skipping file: " + file
          next
        end

        # get the file name
        @file_name = File.basename(file)

        # get the full path
        @full_path = file

        # get the relative path
        @relative_path = @full_path.sub(@models_dir + "/", "")


        # log file info for debugging
        puts "FOUND " + @file_name
        puts ":: Filename: " + @file_name
        puts ":: Folder: " + folder
        puts ":: Full Path: " + @full_path
        puts ":: Relative Path: " + @relative_path

        # create a new item record
        @item = Item.new(name: @file_name, item_name: @file_name, relative_path: @relative_path, directory: false, description: nil)

        # save the item record
        @item.save!
      end
    end


    puts "Crawling items..."
    crawl_folder(@models_dir)
  end
end
