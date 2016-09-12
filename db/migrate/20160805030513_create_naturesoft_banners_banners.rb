class CreateNaturesoftBannersBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_banners_banners do |t|
      t.string :image_url
      t.string :name
      t.string :link_url
      t.text :description
      t.string :status, default: "active"
      t.references :category, index: true, references: :naturesoft_banners_categories
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
