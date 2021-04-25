class UpdateApikeyInUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :apikey, :api_key 
    end
  end
end
