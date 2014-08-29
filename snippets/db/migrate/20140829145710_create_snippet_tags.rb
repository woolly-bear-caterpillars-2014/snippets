class CreateSnippetTags < ActiveRecord::Migration
  def change
    create_table :snippet_tags do |t|
    	belongs_to :snippet
    	belongs_to :tag
      t.timestamps
    end
  end
end
