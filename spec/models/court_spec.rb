require 'rails_helper'

RSpec.describe Court, type: :model do
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }
end
