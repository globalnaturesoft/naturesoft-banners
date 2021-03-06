class CreateNaturesoftBannerTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :naturesoft_banners_banner_types do |t|
      t.string :name
      t.integer :width, default: 1
      t.integer :height, default: 1
      t.references :user, index: true, references: :naturesoft_users

      t.timestamps
    end
  end
end
