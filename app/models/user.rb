class User < ActiveRecord::Base
  has_many :authorizations
  has_many :ideas

  def self.create_from_hash!(hash)
    info = hash['info']
    create(
      :display_name => info['name'],
      :name => info['nickname'],
      :email => info['email'],
      :phone => info['phone'],
      :image => info['image']
    )
  end

  def best_image_url
    image || 'avatar-male.png'
  end
end
