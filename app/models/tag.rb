class Tag < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

	has_many :snippet_tags
	has_many :snippets, through: :snippet_tags

	def self.create_tags(tag_list)
    split_tags = tag_list.downcase.split(",").collect{|tag| tag.strip}
    tag_array = []
    split_tags.each do |tag_title|
      tag = Tag.find_or_create_by(title: tag_title)
      tag_array << tag.id
    end
    tag_array
  end

  def self.tag_list(tags)
    tags.map {|tag| tag.name}.join(", ")
  end
end
