# frozen_string_literal: true

class Block < ApplicationRecord
  belongs_to :notebook

  validates :name, presence: true
  validates :schema_version, presence: true
  validates :data, presence: true
  validates :schema_version,
            inclusion: { in: %w[v1] },
            allow_blank: false,
            allow_nil: false
end
