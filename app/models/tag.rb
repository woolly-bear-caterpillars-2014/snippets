class Tag < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

	has_many :snippet_tags
	has_many :snippets, through: :snippet_tags
end
