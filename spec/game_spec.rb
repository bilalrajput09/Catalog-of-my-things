require_relative '../game'

RSpec.describe Game do
  subject { Game.new(multiplayer: 'yes', last_played_at: '2019-09-09', publish_date: '2000-09-09') }

  describe 'It will check #can_be_archived? method' do
    it 'Should return true because the difference if more than 2 years' do
      expect(subject.can_be_archived?).to eq(true)
    end
  end
end
