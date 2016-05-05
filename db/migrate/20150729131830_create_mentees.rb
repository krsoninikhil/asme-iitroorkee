class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|
      t.integer :user_id
      t.string :contact_no
      t.integer :enrollment_no
      t.string :branch
      t.integer :sex
      t.string :receipt_no

      t.timestamps
    end
  end
end
