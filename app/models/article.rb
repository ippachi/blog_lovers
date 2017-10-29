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

class Article < ApplicationRecord
  belongs_to :user
end
