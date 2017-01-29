require_relative 'space_jams'
require_relative 'runner'

class Album
  attr_accessor :id, :title, :artists, :duration_min, :tracks

  def initialize(id, album_name, artists)
    @id = id
    @title = album_name
    @artists = artists
    @tracks = []
    @duration_min = 0.0
  end

  def summary

    track_names = @tracks.map do |track|
        "- #{track[:title]}"
    end


    @tracks.each do |track|
        track_duration_min = track[:duration_ms].to_f / (1000 * 60) % 60
        @duration_min += track_duration_min
    end

    "Name: #{@title}\nArtist(s): #{@artists}\n" +
    "Duration(min.): #{"%.2f" % (@duration_min)}\n" +
    "Tracks:\n#{track_names.join("\n")}\n\n"

  end
end
