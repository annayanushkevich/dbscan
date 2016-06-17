class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :email
      t.string :password

      t.timestamps null: true
    end
  end
end
