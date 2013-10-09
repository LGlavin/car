class Manufactuer < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :country

  has_many :automobiles,
  inverse_of: :manufactuers,
  dependent: :nullify
end
