class JawboneProfile < ActiveRecord::Base
  belongs_to :user
  has_many :jawbone_weights, dependent: :destroy
  has_many :jawbone_moves, dependent: :destroy
  has_many :jawbone_sleeps, dependent: :destroy
end
