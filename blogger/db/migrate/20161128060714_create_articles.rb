class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      # title and body are the two basic fields we need for articles
      t.string :title
      t.text :body
      # this is to reference the table that's created
      # timestamps will create 2 col: "created_at" and "updated_at" and Rails will manage them automatically for us
      t.timestamps
    end
  end
end
