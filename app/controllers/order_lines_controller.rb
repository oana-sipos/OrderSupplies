class OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy, :more, :less]
  before_filter :authenticate_user!

  # GET /order_lines
  # GET /order_lines.json
  def index
    @order_lines = OrderLine.all
  end

  # GET /order_lines/1
  # GET /order_lines/1.json
  def show
  end

  # GET /order_lines/new
  def new
    @order_line = OrderLine.new
  end

  # GET /order_lines/1/edit
  def edit
  end

  # PUT /order_lines/1/more
  def more
    @order_line.amount += 1
    @order_line.save!
    redirect_to order_path(@order_line.order)
  end

  #PUT /order_lines/1/less
  def less
    @order_line.amount -= 1
    @order_line.save!
    redirect_to order_path(@order_line.order)
  end

  # POST /order_lines
  # POST /order_lines.json
  def create
    @order_line = OrderLine.find(:first, conditions: { article_id: order_line_params[:article_id], order_id: order_line_params[:order_id]})

    if @order_line.nil?
      @order_line = OrderLine.new(order_line_params)
    else 
      @order_line.amount += order_line_params[:amount].to_i
    end

    respond_to do |format|
      if @order_line.save
        format.html { redirect_to order_path(@order_line.order_id), notice: 'Order line was successfully created.' }
        format.json { render 'show', status: :created, location: @order_line }
      else
        format.html { render 'new' }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_lines/1
  # PATCH/PUT /order_lines/1.json
  def update
    respond_to do |format|
      if @order_line.update(order_line_params)
        format.html { redirect_to order_path, notice: 'Order line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_lines/1
  # DELETE /order_lines/1.json
  def destroy
    @order_line.destroy
    respond_to do |format|
      format.html { redirect_to order_lines_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line
      @order_line = OrderLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_line_params
      params.require(:order_line).permit(:order_id, :article_id, :amount)
    end
end
