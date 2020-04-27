class CreateEmailSignups < ActiveRecord::Migration[6.0]
  def change
    create_table :email_signups do |t|
      t.string :email
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
