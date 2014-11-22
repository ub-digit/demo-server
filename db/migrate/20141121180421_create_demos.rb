class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.text :title
      t.text :summary
      t.text :body
      t.text :url

      t.timestamps
    end
  end
end
