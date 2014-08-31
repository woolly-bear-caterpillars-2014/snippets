class Snippet < ActiveRecord::Base

  validates :language, presence: true

	belongs_to :author, class_name: "User", foreign_key: :user_id
	has_many :cheatsheet_snippets
	has_many :cheatsheets, through: :cheatsheet_snippets
	has_many :snippet_tags
	has_many :tags, through: :snippet_tags

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	  else
	    scoped
	  end
	end
end
