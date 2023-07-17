require_relative '../label'
require_relative '../item'

RSpec.describe Label do
  subject { described_class.new(title: 'New', color: 'Green') }
  let(:item_obj) { Item.new(publish_date: '2001-09-09') }

  describe 'Will add item to array' do
    it '#add_item method' do
      expect(subject.items.length).to eq(0)
      subject.add_item(item_obj)
      expect(subject.items.length).to eq(1)
    end
  end
end
