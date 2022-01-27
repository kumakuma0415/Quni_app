class CreateTeishokuMenu2s < ActiveRecord::Migration[5.2]
  def change
    create_table :teishoku_menu2s do |t|
      t.text :content

      t.timestamps
    end
  end
end
