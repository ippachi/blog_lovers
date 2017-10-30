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

require 'rails_helper'

RSpec.describe Profile, type: :model do
end
