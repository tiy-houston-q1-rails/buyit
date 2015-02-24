class CartController < ApplicationController

  def update
    @cart = Cart.find session[:cart_id]
    @cart_item = @cart.cart_items.find params[:id]
    @cart_item.update params.require(:cart_item).permit(:quantity)
    @cart_item.destroy if @cart_item.quantity == 0
    redirect_to cart_path

  end

  def add
    # fetch product
    @product = Product.find params[:product_id]
    # fetch cart or create cart
    cart_id = session[:cart_id]
    if cart_id.nil?
      cart = Cart.create 
      session[:cart_id] = cart.id
    else
      cart = Cart.find cart_id
    end

    # create cart_item in cart for product
    existing_item_in_cart = cart.cart_items.find_by product_id: @product.id
    if existing_item_in_cart
      existing_item_in_cart.update(quantity: existing_item_in_cart.quantity + 1)


    else
      cart.save!
      cart.cart_items.create product: @product
    end
    # redirect to cart show page
    redirect_to cart_path

  end

  def show
    @cart = Cart.find_by id: session[:cart_id]

    case @cart.status
    when "shopping"
      render :show
    when "shipping"
      render :shipping
    when "payment"
      render :payment
    when "confirm"
      session[:cart_id] = nil
      render :thanks
    end

  end

  def start_shipping
    @cart = Cart.find session[:cart_id]
    @cart.update status: "shipping"
    redirect_to cart_path
  end

  def update_shipping
    @cart = Cart.find session[:cart_id]
    @cart.update params.require(:cart).permit(:address_line_1, :address_line_2, :city, :state, :zip)
    @cart.update status: "payment"
    redirect_to cart_path
  end
end
