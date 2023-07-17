require_relative '../author'
require_relative '../item'

RSpec.describe Author do
  subject { Author.new(first_name: 'Bilal', last_name: 'Ahmed') }

  let(:item_obj) { Item.new(publish_date: '2001-09-09') }

  it '#add_item method' do
    expect(subject.items.length).to eq(0)
    subject.add_item(item_obj)
    expect(subject.items.length).to eq(1)
  end
end
