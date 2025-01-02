class DesignsController < ApplicationController
  def index
    # @folders = Dir["./models/*"].map { |f| f.sub("./models/", "") }
    # # Current working directory
    @my_env = ENV["ENVIRONMENT"]
    @dir = Dir.pwd
    @folders = Dir[@dir + "/models/*"].map { |f| f.sub(@dir + "/models/", "") }
    logger.debug @dir
  end
end
