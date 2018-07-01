class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.belongs_to :notebook, index: true, foreign_key: true
      t.string :name
      t.json :data
      t.string :schema_version
      t.timestamps
    end
  end
end
