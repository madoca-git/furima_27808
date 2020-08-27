class Name < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :birthday
  end
end
