class ProductController < ApplicationController
  before_filter :initialize_cart

  def index
    @products = Product.order(:name).page(params[:page])
    @featured_products = Product.all.shuffle[0..3]
  end

  def cfl
    @cfl = Product.where(:category_id => 1)
  end

  def search_cfl
    @searched_cfl = Product.where("name LIKE ? or description LIKE ?", "%#{params[:keywords]}%").where(:category_id => 1)
  end

  def nfl
    @nfl = Product.where(:category_id => 2)
  end

  def search_nfl
    @searched_nfl = Product.where("name LIKE ? or description LIKE ?", "%#{params[:keywords]}%").where(:category_id => 2)
  end

  def nba
    @nba = Product.where(:category_id => 3)
  end

  def search_nba
    @searched_nba = Product.where("name LIKE ? or description LIKE ?", "%#{params[:keywords]}%").where(:category_id => 3)
  end

  def mlb
    @mlb = Product.where(:category_id => 4)
  end

  def search_mlb
    @searched_mlb = Product.where("name LIKE ? or description LIKE ?", "%#{params[:keywords]}%").where(:category_id => 4)
  end

  def nhl
    @nhl = Product.where(:category_id => 5)
  end

  def search_nhl
    @searched_nhl = Product.where("name LIKE ? or description LIKE ?", "%#{params[:keywords]}%").where(:category_id => 5)
  end

  def add_product
    id = params[:id].to_i
    session[:cart] << id  unless session[:cart].include?(id)
    redirect_to :action => :index
  end

  def remove_product
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to :action => :index
  end

  def clear_cart
    session[:cart] = nil
    redirect_to :action => :index
  end

  def show
    @product = Product.find(params[:id])
  end

  def sale
    @sale_products = Product.where(:price => 12.95)
  end

  def new
    @new_products = Product.order(:updated_at).limit(10)
  end

  def search_results
    @searched_products = Product.where("name LIKE ? or description LIKE ?", "%#{params[:keywords]}%")
  end

  def checkout
    @customer = Customer.new
    @provinces = Province.all
  end

  def finish_checkout
    @customer = Customer.new(params[:customer])

    if @customer.save
      @order = @customer.orders.build
      @order.pst_rate = @customer.province.pst
      @order.gst_rate = @customer.province.gst
      @order.hst_rate = @customer.province.hst
      @order.status = "New"
      @order.save

      @total_price = 0
      @total_tax_rate = @customer.province.pst + @customer.province.gst + @customer.province.hst

      session[:cart].each do |id|
       product = Product.find(id)
       line_item = @order.lineItems.build
       line_item.product = product
       line_item.price = product.price
       line_item.quantity = 1
       product.stock_quantity -= 1
       product.save
       line_item.save

       @total_price += product.price
      end

      @total_tax = @total_price * @total_tax_rate
      @total_price = @total_price + @total_tax

      flash[:notice] = "Checkout Successful! Total price paid: $#{@total_price.round(2)}"
    else
      flash[:error] = "Checkout Unsuccessful!"
    end

    session[:cart] = nil
    redirect_to :action => :index
  end

protected
  def initialize_cart
     session[:cart] ||= []
     @cart = []
     session[:cart].each {|id| @cart << Product.find(id)}
   end
end
