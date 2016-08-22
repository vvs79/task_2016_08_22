class AddResumeToContactForms < ActiveRecord::Migration
  def change
  	add_column :contact_forms, :resume, :string
  end
end
