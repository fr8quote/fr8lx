class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
        validates :time_zone, 
          inclusion: { 
           in: ActiveSupport::TimeZone.zones_map.keys 
       }        
         has_many :pages, inverse_of: :user       
         has_many :status_times, inverse_of: :user
         has_many :trips, inverse_of: :user
end

