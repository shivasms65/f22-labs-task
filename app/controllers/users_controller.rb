class UsersController < ApplicationController
  before_action :set_user
  layout 'pdf'

  def show
    @user_results = @user.results

    respond_to do |format|
      format.html { render 'show.pdf.erb' }
      format.pdf { render render_pdf } 
    end
  end

  private

  def set_user
    @user = User.find_by(id: user_param[:id])
  end

  def user_param
    params.permit(:id)
  end

  def render_pdf
    is_debug = params.key?('debug')
    filename = "#{@user.name}_#{Date.today.strftime('%b-%d-%Y')}"
    config = { pdf: filename, template: 'users/show.pdf.erb', layout: 'pdf', show_as_html: is_debug, margin: {top: 0, right: 0, bottom: 0, left: 0}, no_pdf_compression: true, no_background: false, background: true, 
    :page_width => '20in', :page_height => '11.25in', disable_smart_shrinking: true, disable_javascript: false, viewport_size: '1920x1080' }
    # config.merge!(javascript_delay: 2000)
    # config.merge!(dpi: 250)
    config.merge!(progress: proc { |output| puts output }) if Rails.env.development? # proc called when console output changes
    config.merge!(disposition: 'attachment') # Enable this to download PDF
    config
  end
end
