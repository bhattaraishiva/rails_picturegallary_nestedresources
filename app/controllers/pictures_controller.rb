class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
    #@pictures = Picture.all
    category = Category.find(params[:category_id])
    @pictures = category.pictures

    respond_to do |format|
      format.html
      format.json {render json: @pictures}
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    category = Category.find(params[:category_id])
    @picture = category.pictures.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json: @picture}
    end
  end

  # GET /pictures/new
  def new
    category = Category.find(params[:category_id])
    @picture = category.pictures.build

    respond_to do |format|
      format.html
      format.json {render json: @picture}
    end
  end

  # GET /pictures/1/edit
  def edit
      category = Category.find(params[:category_id])
      @picture = category.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    category = Category.find(params[:category_id])
    @picture = category.pictures.create(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to [@picture.category, @picture], notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: [@picture.category, @picture] }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    category = Category.find(params[:category_id])
    @picture = category.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params)
        format.html { redirect_to [@picture.category, @picture], notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: [@picture.category, @picture]}
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    category = Category.find(params[:category_id])
    @picture = category.pictures.find(params[:id])

    @picture.destroy
    respond_to do |format|
      format.html { redirect_to category_pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :category_id, :image)
    end
end
