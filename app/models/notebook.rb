class Notebook < ApplicationRecord
  has_many :block, dependent: :destroy

  validates_presence_of :name
end
