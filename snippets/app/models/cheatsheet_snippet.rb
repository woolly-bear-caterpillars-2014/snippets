class CheatsheetSnippet < ActiveRecord::Base
	belongs_to :cheatsheet
	belongs_to :snippet
end
