class User < ActiveRecord::Base
  attr_accessible :display_name, :email, :image, :name, :phone, :slug

  extend FriendlyId
  friendly_id :name, :use => :slugged 
  has_many :authorizations
  has_many :ideas

  def self.create_from_hash!(hash)
    info = hash['info']
    user = create(
      :display_name => info['name'],
      :name => info['nickname'],
      :email => info['email'],
      :phone => info['phone'],
      :image => info['image']
    )
    user
  end
  
  def best_image_url
    image || 'avatar-male.png'
  end
end
