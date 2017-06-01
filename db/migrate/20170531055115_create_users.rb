class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fullname
			t.string :email
			t.string :password_digest, :null => true

      t.timestamps
    end
  end
end
