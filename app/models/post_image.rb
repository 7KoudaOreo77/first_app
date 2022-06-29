class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorite, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  def create
   @post_image = PostImage.new(post_image_params)
   @post_image.user_id = current_user.id
   if @post_image.save
     redirect_to post_images_path
   else
      render :new
   end
  end

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

  @post_image = PostImage.find(1)
  @post_image.get_image

  def get_image
   unless image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    image
  end

  def fovorited_by?(user)
    favorites.exist?(user_id: user.id)
  end

end
