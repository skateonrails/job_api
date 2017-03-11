class Job < ApplicationRecord

  with_options presence: true do |present|
    present.with_options numericality: { only_integer: true } do |integer|
      integer.validates :partner_id, uniqueness: true
      integer.validates :category_id
    end

    present.validates :title, length: { minimum: 2 }
    present.validates :expires_at
    present.validates :state, inclusion: { in: %w(draft active) }
  end

  def activate
    self.state = 'active'
  end

  def activate!
    self.activate
    self.save!
  end
end
