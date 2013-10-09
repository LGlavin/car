class Automobile < ActiveRecord::Base
  validates_presence_of :color
  validates_presence_of :mileage

 validates_numericality_of :year, :greater_than => 1979
 
 belongs_to :manufactuers,
 inverse_of: :automobile,
 dependent: :destroy
end
