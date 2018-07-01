class Block < ApplicationRecord
  belongs_to :notebook

  validates_presence_of :name, :schema_version, :data
  validates :schema_version, inclusion: { in: %w[v1] }, allow_blank: false, allow_nil: false
end
