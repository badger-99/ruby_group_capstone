require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_reader :date, :title, :artist, :genre
  attr_accessor :id, :on_spotify

  def initialize(date, title, artist, genre, on_spotify)
    super(date)
    @title = title
    @artist = artist
    @on_spotify = on_spotify
    add_genre(genre)
  end

  def to_hash
    {
      'id' => @id,
      'date' => @publish_date,
      'title' => @title,
      'artist' => @artist,
      'genre_name' => @genre.name,
      'on_spotify' => @on_spotify
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
