class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name = nil, artist_name = nil)
    @name = name
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect { |e| e.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    name = filename.slice(/\A(.*)-/).slice(-2)
    song = Song.new(name, artist_name)
    @@all << song
    song
  end

end
