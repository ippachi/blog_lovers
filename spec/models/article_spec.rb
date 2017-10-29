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

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'new' do
    let(:article) { build(:article, :with_user) }
    subject { article.save }

    context 'valid' do
      it { is_expected.to be true }
    end

    context 'title is empty' do
      before { article.title = '' }
      it { is_expected.to be false }
    end

    context 'content is empty' do
      before { article.content = '' }
      it { is_expected.to be false }
    end

    context 'user is not exist' do
      before { article.user = nil }
      it { is_expected.to be false }
    end
  end
end
