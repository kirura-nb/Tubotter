class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      # ツイート内容を保持
      # t.string :user_name
      t.string :content

      t.timestamps
    end
  end
end
