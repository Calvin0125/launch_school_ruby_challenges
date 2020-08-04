require 'pry-byebug'
class Poker
  def initialize(hands)
    @hands = hands
  end

  CARD_VALUES = { '2' => 2,
                  '3' => 3,
                  '4' => 4,
                  '5' => 5,
                  '6' => 6,
                  '7' => 7,
                  '8' => 8,
                  '9' => 9,
                  'T' => 10,
                  'J' => 11,
                  'Q' => 12,
                  'K' => 13,
                  'A' => 14
                }

  def evaluate(hand)
    case
    when royal_flush?(hand) then 9
    when straight_flush?(hand) then 8
    when four_of_a_kind?(hand) then 7
    when full_house?(hand) then 6
    when flush?(hand) then 5
    when straight?(hand) then 4
    when three_of_a_kind?(hand) then 3
    when two_pair?(hand) then 2
    when one_pair?(hand) then 1
    else
      0
    end
  end

  def find_best_hands
    max = hand_scores.max
    indices = hand_scores.each_index.select { |i| hand_scores[i] == max }
    best_hands = []
    indices.each { |index| best_hands << @hands[index] }
    best_hands
  end

  def best_hand
    best_hands = find_best_hands
    return best_hands if best_hands.length == 1
    high_score = hand_scores.max
    compare(best_hands, high_score) 
  end

  def compare(best_hands, high_score)
    case high_score
    when 9 then best_hands
    when 8 then compare_high_card(best_hands)
    when 7 then compare_n_of_a_kind(best_hands)
    when 6 then compare_n_of_a_kind(best_hands)
    when 5 then compare_high_card(best_hands)
    when 4 then compare_high_card(best_hands)
    when 3 then compare_n_of_a_kind(best_hands)
    when 2 then compare_n_of_a_kind(best_hands)
    when 1 then compare_n_of_a_kind(best_hands)
    when 0 then compare_high_card(best_hands)
    end
  end

  def compare_high_card(best_hands)
    best_hands = best_hands.sort_by { |hand| card_values(hand).sort.reverse }
    winning_hands = []
    best_hands.each do |hand|
      winning_hands << hand if card_values(hand).sort == card_values(best_hands[-1]).sort
    end
    winning_hands
  end
  #mathematical mode
  def mode(hand)
    counts = Hash.new(0)
    card_values(hand).each do |value|
      counts[value] += 1
    end
    card_values = counts.keys.sort_by { |card_value| counts[card_value] }
    modes = []
    card_values.each do |value|
      modes << value if counts[value] == counts[card_values[-1]]
    end
    modes
  end

  def compare_n_of_a_kind(best_hands)
    best_hands = best_hands.sort_by { |hand| mode(hand).sort.reverse }
    winning_hands = []
    best_hands.each do |hand|
      winning_hands << hand if mode(hand) == mode(best_hands[-1])
    end
    compare_high_card(winning_hands)
  end

  def hand_scores
    @hands.map { |hand| evaluate(hand) }
  end
  
  def card_ranks(hand)
    hand.map(&:chop)
  end

  def card_suits(hand)
    hand.map { |card| card.chars.pop }
  end

  def card_values(hand)
    card_ranks(hand).map { |rank| CARD_VALUES[rank] }
  end

  def one_pair?(hand)
    ranks = card_ranks(hand)
    ranks.each do |rank|
      return true if ranks.count(rank) == 2
    end
    false
  end

  def two_pair?(hand)
    ranks = card_ranks(hand)
    pairs = 0
    ranks.uniq.each do |rank|
      pairs += 1 if ranks.count(rank) == 2
      return true if pairs == 2
    end
    false
  end

  def three_of_a_kind?(hand)
    ranks = card_ranks(hand)
    ranks.each do |rank|
      return true if ranks.count(rank) == 3
    end
    false
  end

  def correct_aces(values)
    if values.include?(2) && values.include?(14)
      values.delete(14)
      values << 1
    end
    values
  end

  def straight?(hand)
    values = correct_aces(card_values(hand)).sort
    index = 0
    until index == (values.length - 2)
      return false unless values[index + 1] == values[index] + 1
      index += 1
    end
    true
  end

  def flush?(hand)
    card_suits(hand).uniq.length == 1
  end

  def full_house?(hand)
    one_pair?(hand) && three_of_a_kind?(hand)
  end

  def four_of_a_kind?(hand)
    ranks = card_ranks(hand)
    ranks.each do |rank|
      return true if ranks.count(rank) == 4
    end
    false
  end

  def straight_flush?(hand)
    straight?(hand) && flush?(hand)
  end

  def royal_flush?(hand)
    straight?(hand) && flush?(hand) && 
    card_ranks(hand).include?('T') && card_ranks(hand).include?('A')
  end
  

end
