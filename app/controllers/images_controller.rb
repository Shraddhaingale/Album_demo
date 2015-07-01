class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_filter :set_album
  before_action :image_params,only: [:create]
  # GET /images
  # GET /images.json
 

  def index
    
       @images = Image.all
      
    
  end

  def show
    @image = @album.images.find params[:id]
  end

  def new
    @image = @album.images.new
  end

  def create
    @image = @album.images.new(image_params)
    @image.user_id = current_user.id
    @image.album = @album
    if @image.save
      redirect_to @album
    else
      render :new
    end
  end

  def edit
    @image = @album.images.find params[:id]
  end

  def update
    @image = @album.images.find params[:id]

    if @image.update_attributes params[:image]
      redirect_to @album
    else
      render :edit
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



 



  
   private
  def set_album
    @album = Album.find params[:album_id]
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      # params[:image]
      params.require(:image).permit(:tag_line,:avatar,:album_id)

      # params.require(:image).permit(:tag_line,:album_id)
    end
end
