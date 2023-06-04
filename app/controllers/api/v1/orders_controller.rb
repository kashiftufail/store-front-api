class Api::V1::OrdersController < ApplicationController
  
  def index  
    orders = Order.includes(:books, :user)
    render json: OrderSerializer.new(orders).serializable_hash.to_json
  end

  def create_token
    source = User.attach_card_to_stripe_customer(current_user.stripe_customer_id, params[:order])  
    render json: source
  end  

  def show
    order = Order.find(params[:id])
    if order.present?      
      render json: OrderSerializer.new(order).serializable_hash.to_json
    else
      render json: "no order with this id"
    end      
  end

  def create        
    if params[:order][:book_ids].present?     
      order = Order.put_order(current_user.id, params[:order][:book_ids])     
      order.present? ? (render json: OrderSerializer.new(order).serializable_hash.to_json) : 
                       (render json: {message: "couldn't find book with these ids"})                       
    else
      render json: {message: "order can't be placed without books"}
    end         
  end    
end



