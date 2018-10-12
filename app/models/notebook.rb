# frozen_string_literal: true

class Notebook < ApplicationRecord
  has_many :blocks, dependent: :destroy

  validates :name, presence: true
end
