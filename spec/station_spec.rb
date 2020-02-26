require 'station'

describe Station do
  context 'has attributes' do
    it 'name' do
      expect(described_class.new("liverpool st", 2)).to respond_to(:name, :zone)
    end
  end
end