require 'journey_log'
describe JourneyLog do
  let(:station) {double :station, zone: 1}
  let(:journey) {journey = Journey.new(:station)}
  let(:journey_class){double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  describe '#start' do
  it 'starts a journey' do
    expect(journey_class).to receive(:new).with(origin_station: station)
    subject.start(station)
  end
end
end