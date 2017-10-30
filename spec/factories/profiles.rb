# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string           default(""), not null
#  bio        :string           default(""), not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :profile do
    name 'name'
    bio 'bio'

    trait :with_user do
      association :user, factory: :user
    end
  end
end
