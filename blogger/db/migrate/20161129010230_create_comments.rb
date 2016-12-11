class CreateComments < ActiveRecord::Migration[5.0]
  def change
    # Foreign keys are a way of marking one-to-one and one-to-many relationships. An article might have zero, five, or one hundred comments. But a comment only belongs to one article. These objects have a one-to-many relationship – one article connects to many comments.
    create_table :comments do |t|
      t.string :author_name
      t.text :body
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
