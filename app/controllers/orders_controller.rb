class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :duplicate]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_line = OrderLine.new
    @article_list = Article.all
    @article_list.each do |option|
      @article_id = option.id
      @article_description = option.description
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders/1/duplicate
  def duplicate
    @new_order = Order.new
    @new_order.order_date = Time.now.to_date
    @new_order.user = current_user
    @order.order_lines.each do |line|
      @new_line = OrderLine.new
      @new_line.article = line.article
      @new_line.amount = line.amount
      @new_line.save!
      @new_order.order_lines << @new_line
    end
    @new_order.save!
    redirect_to order_path(@new_order)
  end

  def send_review
    order = Order.find(params[:id])
    users = User.all

    users.each do |user| 
      OrderMailer.send_for_review_email(user, order, current_user).deliver #deliver actually sends it 
    end
    flash[:success] = t('.review_sent')
    redirect_to order_path(params[:id])
  end

  def send_final
    order = Order.find(params[:id])

    OrderMailer.send_final_order_email(order, current_user).deliver

    flash[:success] = t('.final_order_sent')
    redirect_to order_path(params[:id])
  end
  
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.uuid = SecureRandom.hex(8)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render 'show', status: :created, location: @order }
      else
        format.html { render 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def review
    @order = Order.find_by(uuid: params[:uuid])
    # respond_to do |format|
      # format.html { render layout: false }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:uuid, :order_date, :user_id, :delivery_date)
    end
end
