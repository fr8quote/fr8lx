class AddRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :companies, index: true, foreign_key: true
  end
end
