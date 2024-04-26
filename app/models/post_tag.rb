class PostTag < ApplicationRecord
    # Asociaciones
    belongs_to :post
    belongs_to :tag
  end
  