class Authorization < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :provider, :uid
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_or_create_from_hash(hash, user = nil)
    provider = hash['provider']
    uid = hash['uid']
    auth = find_by_provider_and_uid(provider, uid)
    
    if !auth
      user ||= User.create_from_hash!(hash)
      auth = Authorization.create(:user => user, :uid => uid, :provider => provider)
    end
    
    auth
  end
end
