class House
  def self.recite
    text = []
    (self.pieces.length - 1).downto(0) do |i|
      text << 'This is ' + self.pieces[i][0]
      text << "\n" + self.pieces[i][1] if self.pieces[i][1]
      (i + 1).upto(self.pieces.length - 1) do |index|
        text << ' ' + self.pieces[index][0]
        text << "\n" + self.pieces[index][1] if self.pieces[index][1]
      end
      text << "\n\n"
    end
    text.join.chomp
  end   

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built.']
    ]
  end
end