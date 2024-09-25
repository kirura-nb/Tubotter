class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :user_name
      t.string :user_number
      t.datetime :t_time
      t.text :content
      t.text :comment
      t.integer :diffusion
      t.integer :like

      t.timestamps
    end
  end
end
