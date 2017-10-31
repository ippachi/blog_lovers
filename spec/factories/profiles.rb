# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  name                :string           default(""), not null
#  bio                 :string           default(""), not null
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
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
