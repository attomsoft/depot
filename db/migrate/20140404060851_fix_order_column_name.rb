class FixOrderColumnName < ActiveRecord::Migration
  def up
    rename_column :orders, :names, :name
  end

  def down
    # do nothing since we want to keep it right.
  end
end
