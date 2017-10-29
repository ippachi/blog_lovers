# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  content        :text             not null
#  publish_status :boolean          default(TRUE), not null
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :article do
    title 'test_title'
    content 'test_content'
    publish_status true

    trait :with_user do
      association :user, factory: :user
    end
  end
end
