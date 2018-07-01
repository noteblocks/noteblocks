class Notebook < ApplicationRecord
  has_many :block, dependent: :delete_all
end
