# frozen_string_literal: true

class GroupEntity < ApplicationRecord
  belongs_to :group
  belongs_to :entity
end
