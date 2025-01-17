# frozen_string_literal: true

require "rails_helper"

RSpec.describe Blueprint do
  EXAMPLE_CONFIG = {
    name: "Client A's Space",
    members: [{email: "client-a@example.com"}],
    rooms: [{
      name: "Room A",
      publicity_level: :listed,
      furnitures: {
        markdown_text_block: {content: "Obi Swan Kenobi"}
      }
    }],
    utilities: []
  }.freeze
  describe "#find_or_create" do
    it "respects the Space's current settings" do
      described_class.new(EXAMPLE_CONFIG).find_or_create!

      space = Space.find_by(name: "Client A's Space")

      # @todo add other examples of changing data after the
      # blueprint has been applied
      space.rooms.first.furnitures.first.update(furniture_attributes: {content: "Hey there!"})

      described_class.new(EXAMPLE_CONFIG).find_or_create!

      # @todo add other examples of confirming the changes
      # were not overwritten
      expect(space.rooms.first.furnitures.first.furniture.content).to eql("Hey there!")
    end

    it "Updates a given space" do
      space = create(:space)

      described_class.new(EXAMPLE_CONFIG, space: space).find_or_create!

      expect(space.rooms.count).to be(1)
    end
  end
end
