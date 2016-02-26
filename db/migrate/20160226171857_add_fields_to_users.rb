class AddFieldsToUsers < ActiveRecord::Migration
  def change
    [:username, :first_name, :last_name, :city, :gender].each do |column_name|
      add_column :users, column_name, :string
    end 
  end
end
