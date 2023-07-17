require_relative '../author'

RSpec.describe Author do
  subject { Author.new(first_name: 'Bilal', last_name: 'Ahmed') }
  let(:item_obj) { double('item') }
  it '#add_item method' do
    expect(subject.add_item(item_obj).length).to eq(1)
    subject.add_item(item_obj)
    expect(subject.add_item(item_obj).length).to eq(3)
  end
end
