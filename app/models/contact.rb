class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :territory
  
  validate :presence_of_name_institute

  def presence_of_name_institute
    if name.blank? && institute.blank?
      errors[:base] = "Atleast one of Name or Institute must be present"
    end
  end
end
