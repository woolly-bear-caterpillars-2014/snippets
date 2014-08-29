class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
    	t.string :title
    	t.text :code
    	t.belongs_to :author
      t.timestamps
    end
  end
end
