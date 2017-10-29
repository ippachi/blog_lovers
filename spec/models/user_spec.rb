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
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'registration' do
    let(:user) { build(:user) }
    subject { user.save }

    context 'valid' do
      it { is_expected.to be true }
    end

    context 'email is empty' do
      before { user.email = '' }
      it { is_expected.to be false }
    end

    context 'email is duplicate' do
      before do
        user.save
        @user = user.dup
      end
      it 'should be invalid' do
        expect(@user.save).to be false
      end
    end

    context 'password is empty' do
      before { user.password = '' }
      it { is_expected.to be false }
    end
  end
end
