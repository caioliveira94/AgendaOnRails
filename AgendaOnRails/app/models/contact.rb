class Contact < ActiveRecord::Base
  belongs_to :kind
  has_one :address
  has_many :phones
  
  # Propriedade que permite que o model receba atributos de um model relacionado
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
end
