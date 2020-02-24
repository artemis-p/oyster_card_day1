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
  subject { OysterCard.new }
  it 'deducts balance from card' do
    subject.top_up(15)
    subject.deduct(5)
    expect { subject.deduct(5) }.to(change { subject.balance }.by(-5))
  end
end
