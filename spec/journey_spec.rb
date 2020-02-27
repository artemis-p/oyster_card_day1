require "journey"
describe Journey do
  let(:station) {double :station, zone: 1}
  let(:journey) {journey = Journey.new(:station)}

  it "checks journey for origin station" do
    :journey
    expect(journey).to have_attributes(origin_station: :station)
  end
  it "checks journey for exit station" do
    :journey
    expect(journey).to have_attributes(exit_station: nil)
  end
  it "knows if a journey is complete" do
    :journey
    journey.finish(:station)
    expect(journey).to be_complete
  end
  it "knows if a journey is not complete" do
    :journey
    expect(journey).not_to be_complete
  end
  it "has a penalty fare by default" do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end
end