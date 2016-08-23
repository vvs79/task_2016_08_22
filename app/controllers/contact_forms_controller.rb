include ActionView::Helpers::TextHelper

class ContactFormsController < ApplicationController

  def show
    @contact_form = ContactForm.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Contact form does not exist!'
    redirect_to new_contact_form_path
  end

  def new
    # ContactForm.delete_all
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.save
      redirect_to contact_form_path(@contact_form)
    else
      render 'new'
    end
  end

  private

    def contact_form_params
      params.require(:contact_form).permit(:name, :age, :contact_date, :resume)
    end

end
