module Naturesoft::Banners
  class Banner < ApplicationRecord
    belongs_to :user
    belongs_to :banner_type
  end
end
