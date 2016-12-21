require 'rails_helper'

RSpec.describe Court, type: :model do
  it { is_expected.to respond_to(:created_at) }
  it { is_expected.to respond_to(:updated_at) }

  describe ".nearTo" do
    let(:praca_seca) do
      {
        latitude: -22.8967471,
        longitude: -43.360041
      }
    end

    let!(:icv_court) do
      Court.create(coordinates: { latitude: -22.8909573, longitude: -43.3459742 })
    end

    let!(:baskeire_court) do
      Court.create(coordinates: {
        latitude: -22.8796359,
        longitude: -43.374750000000006
      })
    end

    let!(:ibb_court) do
      Court.create(coordinates: {
        latitude: -22.8885352,
        longitude: -43.41397269999999
      })
    end

    before :each do
      Court.create_indexes
    end

    subject { described_class.near_by(praca_seca) }

    it "returns courts 5km around the coordinates by default" do
      expect(subject.to_a).to eq [icv_court, baskeire_court]
    end

    context "with max distance" do
      subject { described_class.near_by(praca_seca, 10000) }

      it "returns courts around the coordinates" do
        expect(subject.to_a).to eq [icv_court, baskeire_court, ibb_court]
      end
    end

  end

  describe "#latitude" do
    let(:latitude) { -22.123 }

    subject { Court.new(coordinates: { latitude: latitude, longitude: 0 }) }

    it "delegates to coordinates" do
      expect(subject.latitude).to eq latitude
    end
  end

  describe "#longitude" do
    let(:longitude) { -22.123 }

    subject { Court.new(coordinates: { longitude: longitude, latitude: 0 }) }

    it "delegates to coordinates" do
      expect(subject.longitude).to eq longitude
    end
  end
end
