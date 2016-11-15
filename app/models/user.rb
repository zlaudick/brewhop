class User < ApplicationRecord
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # returns a user's status feed
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :brewery_id"
    Micropost.where("brewery_id IN (#{following_ids})
                     OR brewery_id = :brewery_id", brewery_id: id)
  end

  # follows a brewery
  def follow(brewery)
    active_relationships.create(followed_id: brewery.id)
  end

  # unfollows a brewery.
  def unfollow(brewery)
    active_relationships.find_by(followed_id: brewery.id).destroy
  end

  # returns true id the current user is following the brewery.
  def following?(brewery)
    following.include?(brewery)
  end
end
