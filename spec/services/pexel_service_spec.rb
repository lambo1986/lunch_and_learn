require 'rails_helper'

RSpec.describe PexelService, vcr: true, type: :service do
  describe '#images' do
    it 'fetches images for an input param' do
      images = PexelService.new.images('mongolia')

      expect(images).to be_a Hash
      expect(images[:photos].first[:url]).to be_a String
      expect(images[:photos].first[:src][:original]).to be_a String
    end
  end
end
