require 'rails_helper'

describe ContactForm do
  
  it "validates the name and makes sure it's not empty" do
    contact_form = ContactForm.new(name: '', age: 60, contact_date: Time.now)
    contact_form.valid?
    expect(contact_form.errors[:name]).to_not be_empty
  end

  it "validates the age if age > 65 or age < 17" do
    contact_form = ContactForm.new(name: 'Bill Gates', age: 70, contact_date: Time.now)
    expect(contact_form).to be_invalid
  end

  it "validates the name if name is invalid" do
    contact_form = ContactForm.new(name: 'bill Gates', age: 60, contact_date: Time.now)
    expect(contact_form).to be_invalid
  end

  it "validates the name if name is valid and the age if age >= 17 and age <= 65" do
    contact_form = ContactForm.new(name: 'Bill Gates', age: 60, contact_date: Time.now)
    expect(contact_form).to be_valid
  end

end
