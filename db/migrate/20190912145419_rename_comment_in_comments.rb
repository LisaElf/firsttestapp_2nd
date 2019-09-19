class RenameCommentInComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment, :comment_body
  end
end
