class DropColCommentable < ActiveRecord::Migration
  def change
    remove_column :comments, :imageable_id
    remove_column :comments, :imageable_type 
    add_column :comments, :commentable_type, :integer
  end
end
