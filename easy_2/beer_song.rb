class BeerSong
  
  def initialize
    @lyrics_hash = create_lyrics_hash
  end

  def lyrics
    @lyrics_hash.values_at(*(0..99).to_a.reverse).join("\n")
  end

  def verse(verse)
    @lyrics_hash[verse]
  end

  def verses(start, stop)
    @lyrics_hash.values_at(*(stop..start).to_a.reverse).join("\n")
  end

  def create_lyrics_hash
    lyrics = {}
    99.downto(0) do |num|
      case num
      when (3..99)
        lyrics[num] = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
          "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
      when 2
        lyrics[num] = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      when 1
        lyrics[num] = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 0
        lyrics[num] = "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
    lyrics
  end
end