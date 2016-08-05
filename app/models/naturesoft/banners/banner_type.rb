module Naturesoft::Banners
  class BannerType < ApplicationRecord
    belongs_to :user
  end
end
