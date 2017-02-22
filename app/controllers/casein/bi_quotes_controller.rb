# Scaffolding generated by Casein v5.1.1.5

module Casein
  class BiQuotesController < Casein::CaseinController
  
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Bi quotes'
  		@bi_quotes = BiQuote.order(sort_order(:order_number)).paginate :page => params[:page]
    end
  
    def show
      @casein_page_title = 'View bi quote'
      @bi_quote = BiQuote.find params[:id]
    end
  
    def new
      @casein_page_title = 'Add a new bi quote'
    	@bi_quote = BiQuote.new
    end

    def create
      @bi_quote = BiQuote.new bi_quote_params
    
      if @bi_quote.save
        flash[:notice] = 'Bi quote created'
        redirect_to casein_bi_quotes_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new bi quote'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update bi quote'
      
      @bi_quote = BiQuote.find params[:id]
    
      if @bi_quote.update_attributes bi_quote_params
        flash[:notice] = 'Bi quote has been updated'
        redirect_to casein_bi_quotes_path
      else
        flash.now[:warning] = 'There were problems when trying to update this bi quote'
        render :action => :show
      end
    end
 
    def destroy
      @bi_quote = BiQuote.find params[:id]

      @bi_quote.destroy
      flash[:notice] = 'Bi quote has been deleted'
      redirect_to casein_bi_quotes_path
    end
  
    private
      
      def bi_quote_params
        params.require(:bi_quote).permit(:order_number, :order_suffix, :line_number, :ship_prod, :prod_desc, :warehouse, :bi_customer_no, :customer_po, :ship_to_name, :ship_to_address1, :ship_to_city, :ship_to_state, :prod_cost_cents, :price_cents, :sales_cents, :bi_inside_sales_rep_id, :bi_outside_sales_rep_id, :prod_category, :bi_vendor_no, :qty_ord, :enter_date, :promise_date, :request_date)
      end

  end
end