require_relative '../gener'

RSpec.describe Gener do
  subject { described_class.new(name: 'Blue') }
  let(:item_obj) { double('item') }
  it '#add_item method' do
    expect(subject.add_item(item_obj).length).to eq(1)
    subject.add_item(item_obj)
    expect(subject.add_item(item_obj).length).to eq(3)
  end
end
