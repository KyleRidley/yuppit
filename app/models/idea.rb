class Idea < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  belongs_to :user

  def can_edit?(user)
    self.user == user
  end
end
