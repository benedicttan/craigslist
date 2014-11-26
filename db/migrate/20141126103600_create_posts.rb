class CreatePosts < ActiveRecord::Migration

  def change

    create_table :posts do |t|
      t.belongs_to :category
      t.string :title, :description, :email
      t.float :price
      t.timestamps
    end

  end

end
