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

class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/default.jpg',
                    url: 'images/:class/:attachment/:id/:style_:filename'
  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/gif", "image/png"]
end
