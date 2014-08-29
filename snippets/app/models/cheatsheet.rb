class Cheatsheet < ActiveRecord::Base
  belongs_to :user
  has_many :cheatsheet_snippet
  has_many :snippets, :through => :cheatsheet_snippets
end
