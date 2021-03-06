class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :body
      t.timestamp :closed

      t.timestamps
    end
  end
end
