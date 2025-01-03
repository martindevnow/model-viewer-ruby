class DesignsController < ApplicationController
  before_action :set_design, only: %i[ show edit update destroy ]

  # GET /designs or /designs.json
  def index
    @designs = Design.all
  end

  # GET /designs/1 or /designs/1.json
  def show
    @dir = Dir.pwd
    # replace the design full_path with '/' to make it a relative path to the root of the public folder
    @public_stl = @design.full_path.gsub(@dir + "/", "/")
    
    @page_libs = [ :stl_viewer ]
  end

  # GET /designs/new
  def new
    @design = Design.new
  end

  # GET /designs/1/edit
  def edit
  end

  # POST /designs or /designs.json
  def create
    @design = Design.new(design_params)

    respond_to do |format|
      if @design.save
        format.html { redirect_to @design, notice: "Design was successfully created." }
        format.json { render :show, status: :created, location: @design }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designs/1 or /designs/1.json
  def update
    respond_to do |format|
      if @design.update(design_params)
        format.html { redirect_to @design, notice: "Design was successfully updated." }
        format.json { render :show, status: :ok, location: @design }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designs/1 or /designs/1.json
  def destroy
    @design.destroy!

    respond_to do |format|
      format.html { redirect_to designs_path, status: :see_other, notice: "Design was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design
      @design = Design.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def design_params
      params.fetch(:design, {})
    end
end
