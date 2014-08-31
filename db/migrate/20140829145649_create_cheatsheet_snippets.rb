class CreateCheatsheetSnippets < ActiveRecord::Migration
  def change
    create_table :cheatsheet_snippets do |t|
    	t.belongs_to :cheatsheet
    	t.belongs_to :snippet
      t.timestamps
    end
  end
end
