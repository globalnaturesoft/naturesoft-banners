class CreateNaturesoftBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_banners_banners do |t|
      t.string :image_url
      t.string :name
      t.string :link_url
      t.text :description
      t.references :banner_type, index: true, references: :naturesoft_banners_banner_types
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
