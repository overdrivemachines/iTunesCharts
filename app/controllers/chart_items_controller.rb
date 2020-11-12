class ChartItemsController < ApplicationController
  before_action :set_chart_item, only: [:show, :edit, :update, :destroy]

  # GET /chart_items
  def index
    @chart_items = ChartItem.all
  end

  # GET /chart_items/1
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
  def create
    @chart_item = ChartItem.new(chart_item_params)

    if @chart_item.save
      redirect_to @chart_item, notice: 'Chart item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chart_items/1
  def update
    if @chart_item.update(chart_item_params)
      redirect_to @chart_item, notice: 'Chart item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chart_items/1
  def destroy
    @chart_item.destroy
    redirect_to chart_items_url, notice: 'Chart item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart_item
      @chart_item = ChartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chart_item_params
      params.require(:chart_item).permit(:position, :song_id, :top10_count, :top25_count, :top5_count, :integer)
    end
end
