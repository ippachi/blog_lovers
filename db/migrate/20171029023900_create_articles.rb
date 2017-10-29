class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :publish_status, null: false, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
