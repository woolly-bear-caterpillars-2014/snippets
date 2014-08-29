class CreateSnippetTags < ActiveRecord::Migration
  def change
    create_table :snippet_tags do |t|
    	t.belongs_to :snippet
    	t.belongs_to :tag
      t.timestamps
    end
  end
end
