require_relative '../item'
require_relative '../label'
require_relative '../genre'

RSpec.describe Item do
  subject { described_class.new(publish_date: '2001-09-09', archived: true) }

  let(:label_object) { Label.new(title: 'New', color: 'Green') }
  let(:genre_object) { Gener.new(name: 'Blue') }
  let(:item_obj) { double('item') }


  describe 'It will return true' do
    it '#move_to_archive method' do
      expect(subject.move_to_archive).to eq(true)
    end
  end

  describe 'It will add item to label object array' do
    it '#assign_label method' do
      subject.assign_label(label_object)
      expect(label_object.items.length).to eq(1)
    end
  end

  describe 'It will add item to gener object array' do
    it '#assign_gener method' do
      subject.assign_gener(genre_object)
      expect(genre_object.items.length).to eq(1)
    end
  end
end
