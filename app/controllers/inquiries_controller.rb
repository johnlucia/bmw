class InquiriesController < ApplicationController

  before_filter :find_page, :only => [:create, :new]

  def thank_you
    @page = Page.find_by_link_url("/contact/thank_you", :include => [:parts, :slugs])
    render :layout => 'modal'
  end

  def new
    @inquiry = Inquiry.new
    render :layout => 'modal'
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.save
      if @inquiry.ham?
        begin
          InquiryMailer.notification(@inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
        end

        begin
          InquiryMailer.confirmation(@inquiry, request).deliver
        rescue
          logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
        end
      end

      redirect_to thank_you_inquiries_url
    else
      render :action => 'new', :layout => 'modal'
    end
  end

protected

  def find_page
    @page = Page.find_by_link_url('/contact', :include => [:parts, :slugs])
  end

end
