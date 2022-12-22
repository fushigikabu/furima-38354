class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :name, :text, presence: true
  validates :genre_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :delivery_time_id, numericality: {other_than: 1, message: "can't be blank"}

end

