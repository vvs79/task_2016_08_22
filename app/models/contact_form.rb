class ContactForm < ActiveRecord::Base
  validates :name, :age, :contact_date, presence: true
  validates :name, length: { maximum: 150 }

  validates_length_of :name, maximum: 2, :minimum => 2, :tokenizer => lambda {|str| str.scan(/\w+/) }
  validates_format_of :name, with: /^[A-Z][a-z]+\s[A-Z][a-z]+/, :multiline => true, :on => :create

  validates :age, numericality: { only_integer: true }
  validates_inclusion_of :age, :in => 17..65

  mount_uploader :resume, ResumeUploader
end
