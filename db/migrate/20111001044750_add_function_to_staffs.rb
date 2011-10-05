class AddFunctionToStaffs < ActiveRecord::Migration
  def self.up
    add_column :staffs, :function, :string
  end

  def self.down
    remove_column :staffs, :function
  end
end
