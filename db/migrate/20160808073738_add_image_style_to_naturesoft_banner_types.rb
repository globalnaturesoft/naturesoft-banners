class AddImageStyleToNaturesoftBannerTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_banners_banner_types, :image_style, :string
  end
end
