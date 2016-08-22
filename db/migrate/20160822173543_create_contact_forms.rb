class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string   :name
      t.integer  :age
      t.datetime :contact_date
      t.timestamps null: false
    end
  end
end
