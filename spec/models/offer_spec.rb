# == Schema Information
#
# Table name: listings
#
#  id               :bigint           not null, primary key
#  description      :text
#  inexhaustible    :boolean          default(FALSE), not null
#  state            :integer          default("unmatched")
#  tags             :text             default([]), is an Array
#  title            :string
#  type             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  location_id      :bigint
#  person_id        :bigint           not null
#  service_area_id  :bigint           not null
#  submission_id    :bigint
#  urgency_level_id :bigint
#
# Indexes
#
#  index_listings_on_location_id       (location_id)
#  index_listings_on_person_id         (person_id)
#  index_listings_on_service_area_id   (service_area_id)
#  index_listings_on_submission_id     (submission_id)
#  index_listings_on_tags              (tags) USING gin
#  index_listings_on_urgency_level_id  (urgency_level_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (person_id => people.id)
#  fk_rails_...  (service_area_id => service_areas.id)
#  fk_rails_...  (submission_id => submissions.id)
#
require 'rails_helper'

RSpec.describe Offer do
  describe 'matched' do
    it 'returns matched offers' do
      unmatched_offer = create(:offer)
      match = create(:match, :with_ask_and_offer)
      matched_offer = match.provider

      expect(Offer.matched).to eq([matched_offer])
    end
  end

  describe 'matchable' do
    it 'returns matchable offers' do
      unmatched_offer = create(:offer)
      match = create(:match, :with_ask_and_offer)
      matched_offer = match.provider

      expect(Offer.matchable).to eq([unmatched_offer])
    end
  end
end
