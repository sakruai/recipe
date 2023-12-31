class List < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  # 検索方法分岐
   def self.looks(search, word)
    if search == "perfect_match"
      @list = List.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @list = List.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @list = List.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @list = List.where("name LIKE?","%#{word}%")
    else
      @list = List.all
    end
  end
  validates :category, presence: true
end
