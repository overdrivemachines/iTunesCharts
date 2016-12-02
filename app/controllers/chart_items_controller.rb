class ChartItemsController < ApplicationController
  before_action :set_chart_item, only: [:show, :edit, :update, :destroy]

  # GET /chart_items
  # GET /chart_items.json
  def index
    @chart_items = ChartItem.all
  end

  # GET /chart_items/1
  # GET /chart_items/1.json
  def show
  end

  # GET /chart_items/new
  def new
    @chart_item = ChartItem.new
  end

  # GET /chart_items/1/edit
  def edit
  end

  # POST /chart_items
  # POST /chart_items.json
  def create
    @chart_item = ChartItem.new(chart_item_params)

    respond_to do |format|
      if @chart_item.save
        format.html { redirect_to @chart_item, notice: 'Chart item was successfully created.' }
        format.json { render :show, status: :created, location: @chart_item }
      else
        format.html { render :new }
        format.json { render json: @chart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chart_items/1
  # PATCH/PUT /chart_items/1.json
  def update
    respond_to do |format|
      if @chart_item.update(chart_item_params)
        format.html { redirect_to @chart_item, notice: 'Chart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @chart_item }
      else
        format.html { render :edit }
        format.json { render json: @chart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chart_items/1
  # DELETE /chart_items/1.json
  def destroy
    @chart_item.destroy
    respond_to do |format|
      format.html { redirect_to chart_items_url, notice: 'Chart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart_item
      @chart_item = ChartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chart_item_params
      params.require(:chart_item).permit(:song_id, :position, :top5, :top10, :top25)
    end
end
