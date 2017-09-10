# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  role            :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Account < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :role, presence: true

  enum role: { player: 1, host: 2 }
end
