require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  subject { described_class.new(title: 'New', color: 'Green') }
  let(:item) { double('item') }

  describe 'Will add item to array' do
    it '#add_item method' do
      expect(subject.items.length).to eq(0)
      subject.add_item(item)
      expect(subject.items.length).to eq(1)
    end
  end
end
