class CreateTeishokuMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :teishoku_menus do |t|
      t.text :content

      t.timestamps
    end
  end
end
