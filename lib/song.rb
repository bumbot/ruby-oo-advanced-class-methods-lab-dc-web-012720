require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #
  #
  # new code
  #
  def self.create
    song = Song.new

    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.create
    song.name = song_name

    song
  end

  def self.create_by_name(song_name)
    song = Song.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.each do |person|
      if person.name == song_name
        return person
      end
    end

    nil
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end  
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_type)
    array = file_type.split(/.mp3/)
    name = array[0].split(/ - /)
    new_song = self.create_by_name(name[1])
    new_song.artist_name = name[0]
    
    new_song
  end

  def self.create_from_filename(file_type)
    array = file_type.split(/\.mp3/)
    name = array[0].split(/\ - /)
    new_song = self.create_by_name(name[1])
    new_song.artist_name = name[0]
    
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
