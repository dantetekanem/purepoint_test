require "rails_helper"

RSpec.describe RecipePuppy do
  describe "#results" do
    it "check for 20 results for omelet" do
      VCR.use_cassette "search_for_20_results" do
        results = described_class.search('omelet')
        expect(results.size).to eq 20
      end
    end

    it "match the results" do
      VCR.use_cassette "search_for_omelet" do
        omelet = described_class.search('omelet').first
        expect(omelet['title']).to eq "Baked Omelet With Broccoli &amp; Tomato"
      end
    end
  end
end
