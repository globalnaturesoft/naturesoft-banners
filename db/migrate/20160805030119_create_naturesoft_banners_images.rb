class CreateNaturesoftBannersImages < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_banners_images do |t|
      t.string :image_type
      t.string :name
      t.integer :width, default: 1
      t.integer :height, default: 1
      t.string :status, default: "active"
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
