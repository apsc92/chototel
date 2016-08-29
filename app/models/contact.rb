class Contact < ApplicationRecord
  belongs_to :user
  
  validate :presence_of_name_institute
  
  def presence_of_name_institute
    if name.blank? && institute.blank?
      errors[:name] = "Atleast one of name or institute must be present"
    end
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end
end
