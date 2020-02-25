require 'oyster_card'

describe OysterCard do
  let(:station){double :station} 
  it { is_expected.to(respond_to(:balance, :top_up)) }
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
        @card.touch_out
        expect(@card.in_journey).to eq false
      end
      it 'reduces balance on check out by minimum fare' do
        expect {subject.touch_out}.to change{subject.balance}.by(-1)
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
  end
end