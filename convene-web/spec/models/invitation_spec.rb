# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { is_expected.to belong_to(:space).inverse_of(:invitations) }
  it { is_expected.to belong_to(:invitor).class_name('Person').inverse_of(:invitations) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_inclusion_of(:status).in_array(Invitation::STATUSES) }
  it { is_expected.to validate_presence_of(:name) }
end