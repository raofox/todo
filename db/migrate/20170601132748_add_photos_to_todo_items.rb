class AddPhotosToTodoItems < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_items, :photos, :json
  end
end
