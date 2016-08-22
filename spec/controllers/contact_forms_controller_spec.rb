require 'rails_helper'

describe ContactFormsController do

  describe "show action" do
    it "renders show template if an contact_form is found" do
      contact_form = create(:contact_form)
      get :show, id: contact_form.id
      response.should render_template('show')
    end
  end

  describe "create action" do
    it "redirects to contact_form page if validations pass" do
      post :create, contact_form: { name: 'Bill Gates', age: 60, contact_date: Time.now }
      response.should redirect_to(contact_form_path(assigns(:contact_form)))
    end

    it "renders new page again if validations fail" do
      post :create, contact_form: { name: 'Bill Gates', age: 10, contact_date: Time.now }
      response.should render_template('new')
    end
  end

end
