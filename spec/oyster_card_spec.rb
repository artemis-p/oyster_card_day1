require 'oyster_card'

describe OysterCard do
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

  describe 'journeys' do
    before(:each) do
      @card = OysterCard.new(50)
    end
      it 'in_journey to be true after the card has been touched in' do
        @card.touch_in
        expect(@card).to be_in_journey
      end
      it 'in_journey to be false after the card has been touched out' do
        @card.touch_in
        @card.touch_out
        expect(@card).not_to be_in_journey
      end
      it 'reduces balance on check out by minimum fare' do
        expect {subject.touch_out}.to change{subject.balance}.by(-1)
      end
  end
end
