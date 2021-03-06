# Scaffolding generated by Casein v5.1.1.5

module Casein
  class BiVendorsController < Casein::CaseinController

    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]

    def index
      @casein_page_title = 'Bi vendors'
  		@bi_vendors = BiVendor.order(sort_order(:no)).paginate :page => params[:page]
    end

    def show
      @casein_page_title = 'View bi vendor'
      @bi_vendor = BiVendor.find params[:id]
    end

    def new
      @casein_page_title = 'Add a new bi vendor'
    	@bi_vendor = BiVendor.new
    end

    def create
      @bi_vendor = BiVendor.new bi_vendor_params

      if @bi_vendor.save
        flash[:notice] = 'Bi vendor created'
        redirect_to casein_bi_vendors_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new bi vendor'
        render :action => :new
      end
    end

    def update
      @casein_page_title = 'Update bi vendor'

      @bi_vendor = BiVendor.find params[:id]

      if @bi_vendor.update_attributes bi_vendor_params
        flash[:notice] = 'Bi vendor has been updated'
        redirect_to casein_bi_vendors_path
      else
        flash.now[:warning] = 'There were problems when trying to update this bi vendor'
        render :action => :show
      end
    end

    def destroy
      @bi_vendor = BiVendor.find params[:id]

      @bi_vendor.destroy
      flash[:notice] = 'Bi vendor has been deleted'
      redirect_to casein_bi_vendors_path
    end

    private

      def bi_vendor_params
        params.require(:bi_vendor).permit(:no, :name)
      end

  end
end
