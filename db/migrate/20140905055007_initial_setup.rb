class InitialSetup < ActiveRecord::Migration
  def change

  	create_table :users do |t| 
  		t.string :email 
  		t.string :password_digest 
  		t.attachment :avatar 
  		t.timestamps
  	end

  	create_table :links do |t| 
  		t.string :url 
  		t.belongs_to :user 
  		t.integer :sum_vote  
  		t.timestamps
  	end

  	create_table :votes do |t| 
  		t.belongs_to :user 
  		t.belongs_to :link
  		t.timestamps 
  	end 

  	create_table :comments do |t|
  		t.belongs_to :user 
  		t.belongs_to :link 
  		t.timestamps
  	end 
  end
end
