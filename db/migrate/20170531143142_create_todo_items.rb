class CreateTodoItems < ActiveRecord::Migration[5.1]
  def change
    create_table :todo_items do |t|
      t.string :item
      t.references :todo_list
      t.timestamps
    end
  end
end
