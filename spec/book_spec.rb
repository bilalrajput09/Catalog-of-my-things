require_relative '../book'

RSpec.describe Book do
  subject { described_class.new(publisher: 'Junaid', cover_state: 'good', publish_date: '2020-09-09', archived: false) }

  it 'should be instance of book class' do
    subject.instance_of?(Book)
    expect(subject.instance_of?(Book)).to eq(true)
  end

  describe 'it should return false'
  it '#can_be_archived method' do
    expect(subject.can_be_archived?).to eq(false)
  end
end
