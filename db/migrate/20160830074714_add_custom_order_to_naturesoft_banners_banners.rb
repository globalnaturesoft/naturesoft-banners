class AddCustomOrderToNaturesoftBannersBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_banners_banners, :custom_order, :integer, default: 0
  end
end
