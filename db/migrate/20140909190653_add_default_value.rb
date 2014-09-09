class AddDefaultValue < ActiveRecord::Migration
  def change

    change_column :links, :sum_vote, :integer, default: 0

  end
end
