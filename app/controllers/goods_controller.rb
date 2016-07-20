class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_no_authentication, only: [:new, :create, :cancel ]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.all
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
  end
  
   def menu
   end

   def adduser
    @user=User.new
   # @company=Company.new
   end
  # GET /goods/new
  def new
    
		@xlsx = Roo::Spreadsheet.open('./xls/price_gbi_fbs.xls')
 
 @s1=@xlsx.info
 @s2=@xlsx.sheet(0).row(1)
 
  
  @page = Roo::Spreadsheet.open('./xls/price_gbi_fbs.xls')
	  (7..14).each do |i| 
	  @price = Good.new
        s2=@xlsx.sheet(0).cell(i,1)
		
		
	    @price.name=s2.to_s
		
		#@price.name << @price
		s2=@xlsx.sheet(0).cell(i,3)
		
		@price.price=s2
		#@price << @price
		@price.save
       
      end  
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = Good.new(good_params)

    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Good was successfully created.' }
        format.json { render :show, status: :created, location: @good }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params)
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.fetch(:good, {})
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
