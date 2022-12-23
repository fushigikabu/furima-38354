class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time

  has_one_attached :image

  validates :name, :text, :image, presence: true
  validates :genre_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :delivery_time_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

end

