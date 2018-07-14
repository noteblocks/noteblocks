# frozen_string_literal: true

class Notebook < ApplicationRecord
  has_many :block, dependent: :destroy

  validates :name, presence: true
end
