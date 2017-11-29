class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {greater_than: 0}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
