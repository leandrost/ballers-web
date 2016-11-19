require 'rails_helper'

RSpec.describe Court, type: :model do
  subject {  }

  describe ".marker" do
    it "return a map marker" do
      expect(subject.marker).to eq(
        key: "2",
        position: { lat: subject.latitude, lng: subject.longitude },
        defaultAnimation: 2,
      )
    end
  end
end
