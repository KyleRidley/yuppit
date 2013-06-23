class Idea < ActiveRecord::Base
  attr_accessible :body, :category, :title

  extend FriendlyId
  friendly_id :title, :use => :slugged
  belongs_to :user

  def can_edit?(user)
    self.user == user
  end
end
