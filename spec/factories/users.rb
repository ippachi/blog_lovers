# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  screen_name            :string           not null
#

FactoryBot.define do
  factory :user do
    email 'test@example.com'
    screen_name 'test_name'
    password 'password'

    trait :with_articles do
      after :build do |user|
        user.articles << FactoryBot.build(:article)
        user.articles << FactoryBot.build(:article)
        user.articles << FactoryBot.build(:article)
      end
    end

    trait :with_profile do
      after :build do |user|
        user.profile = FactoryBot.build(:profile)
      end
    end
  end
end
