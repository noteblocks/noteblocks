class ChangeBlocksDataToJsonb < ActiveRecord::Migration[5.2]
  def change
    change_column :blocks, :data, :jsonb
  end
end
