class Post < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true

	mount_uploader :image, ImageUploader

	belongs_to :user
end
