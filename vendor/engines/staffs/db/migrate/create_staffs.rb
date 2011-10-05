class CreateStaffs < ActiveRecord::Migration

  def self.up
    create_table :staffs do |t|
      t.string :name
      t.string :title
      t.integer :thumbnail_id
      t.integer :image_id
      t.text :bio
      t.integer :position

      t.timestamps
    end

    add_index :staffs, :id

    load(Rails.root.join('db', 'seeds', 'staffs.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "staffs"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/staffs"})
    end

    drop_table :staffs
  end

end
