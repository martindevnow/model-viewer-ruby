class ModelsController < ApplicationController
  def index
    @folders = Dir["./models/*"].map { |f| f.sub("./models/", "") }
  end

  def folder(id)
    @folder_name = id
  end
end
