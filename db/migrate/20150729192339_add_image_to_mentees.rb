class AddImageToMentees < ActiveRecord::Migration
  def change
    add_column :mentees, :image, :string
  end
end
