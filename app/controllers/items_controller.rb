class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy switch_availability]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_variables, only: [:new, :edit]

  # GET /items or /items.json
  def index
    @items = Item.includes(:user).where(availability: TRUE)
  end

  # GET /items/1 or /items/1.json
  def show
    
  end

  # GET /items/new
  def new
    @item = Item.new
    
  end

  # GET /items/1/edit
  def edit
    # show price in $dd.cc formar when editing as data is being saved in cents
    @item.price_per_day /= 100.00
    @item.deposit /= 100.00
  end

  # POST /items or /items.json
  def create
    @item = current_user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def switch_availability
    if @item.availability == TRUE
      @item.update_column(:availability, FALSE)
    elsif @item.availability == FALSE
      @item.update_column(:availability, TRUE)
    end
    redirect_back fallback_location: dashboard_path, notice:"Availability was successfully updated"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:user_id, :category_id, :name, :description, :condition, :deposit, :price_per_day, :picture, brand_ids: [], brands_attributes: [:name])
    end

    def set_variables
      @categories = Category.all
      @conditions = Item.conditions.keys
      @brands = Brand.all
    end
end
