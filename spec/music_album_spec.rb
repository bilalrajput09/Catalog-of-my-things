require_relative '../music_album'

RSpec.describe MusicAlbum do
  subject { MusicAlbum.new(on_spotify: true, publish_date: '2000-09-09') }
  describe 'It should be an instance of music album class' do
    it 'Will check if its an instance' do
      boolean = subject.instance_of?(MusicAlbum)
      expect(boolean).to eq(true)
    end
  end

  describe 'It will check methods' do
    it '#can_be_archived? method' do
      expect(subject.can_be_archived?).to eq(true)
    end
  end
end