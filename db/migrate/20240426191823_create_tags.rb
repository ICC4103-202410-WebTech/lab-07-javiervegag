class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags, if_not_exists: true do |t|
      t.string :name
      t.timestamps
    end
  end
end

