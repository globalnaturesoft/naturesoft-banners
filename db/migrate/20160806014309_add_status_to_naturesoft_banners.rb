class AddStatusToNaturesoftBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :naturesoft_banners_banners, :status, :string, default: "active"
  end
end
