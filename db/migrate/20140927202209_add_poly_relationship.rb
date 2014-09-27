class AddPolyRelationship < ActiveRecord::Migration
  def change
    add_column :comments, :imageable_id, :integer
    add_column :comments, :imageable_type, :integer 
  end
end
