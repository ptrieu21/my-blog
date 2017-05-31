class Article < ApplicationRecord
	is_impressionable
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :content, presence: true
	validates :user_id, presence: true

	def self.search(search)
		where("title ILIKE ?", "%#{search}%")
	end
end
