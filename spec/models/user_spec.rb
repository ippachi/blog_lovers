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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'registration' do
    let(:user) { build(:user) }
    subject { user.save }

    context 'when it is valid' do
      it { is_expected.to be true }
    end

    context 'when email is empty' do
      before { user.email = '' }
      it { is_expected.to be false }
    end

    context 'when email is duplicate' do
      before do
        user.save
        @user = user.dup
        @user.screen_name = 'other'
      end
      it 'should be invalid' do
        expect(@user.save).to be false
      end
    end

    context 'when password is empty' do
      before { user.password = '' }
      it { is_expected.to be false }
    end

    context 'when screen name is duplicatate' do
      before do
        user.save
        @user = user.dup
        @user.email = 'other'
      end
      it 'should be invalid' do
        expect(@user.save).to be false
      end
    end
  end

  describe 'user_articles' do
    let(:user) { build(:user, :with_articles) }
    subject { user.articles }
    it { is_expected.to_not be_empty }
  end

  describe 'user_profile' do
    let(:user) { build(:user, :with_profile) }
    subject { user.profile }
    it { is_expected.to_not be_nil }
  end
end
