class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :status_times, inverse_of: :trip
  accepts_nested_attributes_for :status_times, allow_destroy: true
  has_many :status_times, inverse_of: :trip
  
 
   
end
