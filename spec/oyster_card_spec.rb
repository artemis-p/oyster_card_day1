require 'oyster_card'

describe OysterCard do
  let(:station){double :station} 
  let(:station_two){double :station_two} 
  it { is_expected.to(respond_to(:balance, :top_up, :store_journey)) }
  it 'has default balance of 0' do
    expect(subject.balance).to(eq(0))
  end
  it 'adds to balance when topped up' do
    subject.top_up(5)
    expect(subject.balance).to(eq(5))
  end
  it 'throws an error when exceeding max balance' do
    expect { OysterCard.new.top_up(OysterCard::MAX_BALANCE + 1) }.to(raise_error("Exceeded maximum balance of £#{OysterCard::MAX_BALANCE}"))
  end

  describe 'fares' do
    before(:each) do
      @card = OysterCard.new(50)
    end
      it 'in_journey to be true after the card has been touched in' do
        @card.touch_in(station)
        expect(@card.in_journey).to eq true
      end
      it 'in_journey to be false after the card has been touched out' do
        @card.touch_in(station)
        @card.touch_out(station)
        expect(@card.in_journey).to eq false
      end
      it 'reduces balance on check out by minimum fare' do
        @card.touch_in(station)
        expect {@card.touch_out(station)}.to change{@card.balance}.by(-1)
      end
    end

  describe 'storing journeys' do
    before(:each) do
      @card = OysterCard.new(50)
    end
      it 'journeys will store origin station' do 
        @card.touch_in(station)
        expect(@card.origin_station).to eq station
     end 
     it 'tests journey to have attributes' do
       expect(subject).to have_attributes(journey: [])
    end
    it 'journey will store exit_station' do
      expect(subject).to have_attributes(exit_station: nil)
    end
    it 'journey will store exit station' do 
      @card.touch_out(station)
      expect(@card.exit_station).to eq station
   end 
   it 'store journey will record journey into journey array' do
    @card.touch_in(station)
    @card.touch_out(station_two)
    expect(@card.journey).to include({origin_station: station, exit_station: station_two})
    end
  end
end