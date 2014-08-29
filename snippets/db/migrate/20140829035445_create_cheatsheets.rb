class CreateCheatsheets < ActiveRecord::Migration
  def change
    create_table :cheatsheets do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps
    end
  end
end
