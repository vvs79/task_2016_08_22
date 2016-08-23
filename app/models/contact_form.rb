class ContactForm < ActiveRecord::Base
  validates :name, :age, :contact_date, presence: true
  validates :name, length: { maximum: 150 }

  validates_length_of :name, is: 2, tokenizer: lambda {|str| str.scan(/\w+/) } # two words validation
  validates_format_of :name, with: /^[A-Z][a-z]+\s[A-Z][a-z]+/, multiline: true, on: :create # capitalize first letter of each words validation

  validates              :age, numericality: { only_integer: true }
  validates_inclusion_of :age, in: 17..65 # check if a number is included in a range (17..65)

  mount_uploader :resume, ResumeUploader
end
