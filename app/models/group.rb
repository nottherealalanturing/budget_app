class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', dependent: :destroy
  has_many :trade_groups, dependent: :destroy
  has_many :trades, through: :trade_groups, dependent: :destroy
  has_one_attached :icon

  after_save :add_default_icon

  validates :name, presence: true

  def icon_thumbnail
    icon.variant(resize_to_limit: [100, 100]).processed
  end

  private

  def add_default_icon
    return if icon.attached?

    icon.attach(
      io: File.open(
        Rails.root.join(
          'app/assets/images/icon.png'
        )
      ), filename: 'icon.png',
      content_type: 'image/jpg'
    )
  end
end
