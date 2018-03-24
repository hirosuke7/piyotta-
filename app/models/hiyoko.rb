class Hiyoko < ApplicationRecord
  has_many :posts
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  def post
    return Post.where(hiyoko_id: self.id)
  end



end
