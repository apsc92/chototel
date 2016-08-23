class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :territory
  
  validate :presence_of_name_institute

  def presence_of_name_institute
    if name.blank? && institute.blank?
      errors[:name] = "Atleast one of name or institute must be present"
    end
  end
end
