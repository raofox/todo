class TodoItem < ApplicationRecord
  belongs_to :todo_list

  mount_uploaders :photos, PhotoUploader
end
