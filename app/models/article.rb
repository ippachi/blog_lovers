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
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :content
  validates :publish_status, inclusion: { in: [true, false] }

  def content_to_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(content)
  end
end
