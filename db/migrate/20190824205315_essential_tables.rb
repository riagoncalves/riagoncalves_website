class EssentialTables < ActiveRecord::Migration[5.2]
  def change

    create_table :profile do |t|
      t.string :image
      t.string :name
      t.string :description

      t.timestamps
    end

    create_table :skills do |t|
      t.string :icon
      t.string :name

      t.timestamps
    end

    create_table :contacts do |t|
      t.string :icon
      t.string :social
      t.string :link

      t.timestamps
    end

  end
end
