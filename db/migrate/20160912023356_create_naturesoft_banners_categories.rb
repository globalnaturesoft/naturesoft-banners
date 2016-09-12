class CreateNaturesoftBannersCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_banners_categories do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.string :image_scale
      t.string :status, :default => "active"
      t.references :user, references: :naturesoft_users, index: true

      t.timestamps
    end
  end
end
