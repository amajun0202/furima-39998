class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :origin_region
  belongs_to :shipping_day

  validates :category_id,      presence: true, numericality: { other_than: 1, message: "を選んでください！" }
  validates :condition_id,     presence: true, numericality: { other_than: 1, message: "を選んでください！" }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "を選んでください！" }
  validates :origin_region_id, presence: true, numericality: { other_than: 1, message: "を選んでください！" }
  validates :shipping_day_id,  presence: true, numericality: { other_than: 1, message: "を選んでください！" }

  validates :image,           presence: true
  validates :item_name,       presence: true
  validates :description,     presence: true
  validates :cost,            presence: true, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    only_integer: true,
    message: "は¥300から¥9,999,999の範囲で半角数値を入力してください!"
  }
end
