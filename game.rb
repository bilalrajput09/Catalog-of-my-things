require_relative './item'
require 'date'


class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer:, last_played_at:, publish_date:)
    super(publish_date: publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    return true if super() && last_played_at_older?

    false
  end

  private

  def last_played_at_older?
    date_now = Date.today
    last_played_at_object = Date.parse(@last_played_at)
    difference = (date_now - last_played_at_object) / 365
    return true if difference > 2

    false
  end
end
