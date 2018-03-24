class Post < ApplicationRecord
  belongs_to :hiyoko
  has_many :likes
  validates :content, {presence: true, length: {maximum: 140}}

  def hiyoko
      return Hiyoko.find_by(id: self.hiyoko_id)
  end
end
