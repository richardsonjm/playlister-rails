class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :song_genres
  has_many :genres, :through => :song_genres

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(:name => artist_name)
    # self.artist = Artist.first_or_create_by(:name => artist_name)
  end

  def genre_names=(csv_genre_names)
    Genre.find_or_create_by_csv_string(csv_genre_names).each do |genre|
      self.add_genre(genre)
    end
  end

  def add_genre(genre)
    self.song_genres.build(:genre => genre)
  end

end
