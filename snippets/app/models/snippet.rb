class Snippet < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	has_many :cheatsheet_snippets
	has_many :cheatsheets, through: :cheatsheet_snippets
end
