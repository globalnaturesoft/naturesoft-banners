class AddStatusToNaturesoftBannerTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_banners_banner_types, :status, :string, default: "active"
  end
end
