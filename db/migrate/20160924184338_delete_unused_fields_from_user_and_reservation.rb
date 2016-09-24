class DeleteUnusedFieldsFromUserAndReservation < ActiveRecord::Migration
  def change
    remove_column :reservations, :status, :string    
    remove_column :reservations, :advance, :integer 
    remove_column :reservations, :amount, :integer 

    remove_column :users, :full_name, :string    
  end
end
