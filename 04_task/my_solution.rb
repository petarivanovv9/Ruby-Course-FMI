class Card
  attr_reader :rank
  attr_reader :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    rank.to_s.capitalize + " of " + suit.to_s.capitalize
  end

  def ==(other)
    rank == other.rank and suit == other.suit
  end
end

class Deck
  include Enumerable

  SUITS = [:spades, :hearts, :diamonds, :clubs]

  def generate_all_cards(ranks)
    ranks.product(SUITS).collect { |x, y| Card.new(x, y) }
  end

  def initialize(cards = [])
    @ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
    @ranks_ascending = Hash[(0...@ranks.size).zip @ranks]
    cards.empty? ? @cards = generate_all_cards(@ranks) : @cards = cards
  end

  def each
    @cards.each { |card| yield card }
  end

  def size
    @cards.size
  end

  def draw_top_card
    @cards.delete_at(0)
  end

  def draw_bottom_card
    @cards.delete_at(-1)
  end

  def top_card
    @cards.first
  end

  def bottom_card
    @cards.last
  end

  def shuffle
    @cards.shuffle!
  end

  def sort
    @cards.sort_by! { |x| [x.suit, @ranks_ascending.key(x.rank)] }.reverse!
  end

  def to_s
    @cards.map { |card| card.to_s + "\n" }.reduce(&:+)
  end

  def deal
    Hand.new(@cards, @ranks_ascending)
  end
end

class Hand
  def initialize(cards, ranks_ascending)
    @cards_hand = cards
    @ranks_ascending = ranks_ascending
  end

  def size
    @cards_hand.size
  end

  def to_s
    @cards_hand.map { |card| card.to_s + "\n" }.reduce(&:+)
  end
end

class WarDeck < Deck
  DECK_SIZE = 52
  CARDS_IN_HAND = 26

  def deal
    cards_hand = @cards[0..CARDS_IN_HAND - 1]
    @cards = @cards - cards_hand
    WarDeckHand.new(cards_hand, @ranks_ascending)
  end
end

class WarDeckHand < Hand
  def play_card
    @cards_hand.delete(@cards_hand.sample)
  end

  def allow_face_up?
    size <= 3 ? true : false
  end
end

class BeloteDeck < Deck
  DECK_SIZE = 32
  CARDS_IN_HAND = 8

  def initialize(cards = [])
    @ranks = [7, 8, 9, :jack, :queen, :king, 10, :ace]
    @ranks_ascending = Hash[(0...@ranks.size).zip @ranks]
    cards.empty? ? @cards = generate_all_cards(@ranks) : @cards = cards
  end

  def deal
    cards_hand = @cards[0..CARDS_IN_HAND - 1]
    @cards = @cards - cards_hand
    BeloteDeckHand.new(cards_hand, @ranks_ascending)
  end
end

class BeloteDeckHand < Hand
  def get_rank_key(card)
    @ranks_ascending.key(card.rank)
  end

  def highest_of_suit(suit)
    @cards_hand.select { |x| x.suit == suit }.
                max_by { |x| get_rank_key(x) }
  end

  def belote?
    pairs = [:spades, :hearts, :diamonds, :clubs].product([:king, :queen]).
          map { |s, r| Card.new(r, s) }
    cards_hand_combinations = sort.combination(2).to_a

    cards_hand_combinations.include?([pairs[0], pairs[1]]) or
    cards_hand_combinations.include?([pairs[2], pairs[3]]) or
    cards_hand_combinations.include?([pairs[4], pairs[5]]) or
    cards_hand_combinations.include?([pairs[6], pairs[7]])
  end

  def sort
    @cards_hand.sort_by { |x| [x.suit, get_rank_key(x)] }.reverse
  end

  def are_n_numbers_consecutive(n, x)
    if x.all? { |a| a.suit == x[0].suit }
      are_consecutive = true
      return x.each_cons(2).all? { |x,y| ((get_rank_key(x) -
                                           get_rank_key(y)) == 1) }
    end
    false
  end

  def tierce?
    sort.each_cons(3).each do |x|
      result = are_n_numbers_consecutive(3, x)
      if result then return true end
    end
    false
  end

  def quarte?
    sort.each_cons(4).each do |x|
      result = are_n_numbers_consecutive(4, x)
      if result then return true end
    end
    false
  end

  def quint?
    sort.each_cons(5).each do |x|
      result = are_n_numbers_consecutive(5, x)
      if result then return true end
    end
    false
  end

  def carre_of_jacks?
    @cards_hand.include?(Card.new(:jack, :spades))   and
    @cards_hand.include?(Card.new(:jack, :hearts))   and
    @cards_hand.include?(Card.new(:jack, :diamonds)) and
    @cards_hand.include?(Card.new(:jack, :clubs))
  end

  def carre_of_nines?
    @cards_hand.include?(Card.new(9, :spades))   and
    @cards_hand.include?(Card.new(9, :hearts))   and
    @cards_hand.include?(Card.new(9, :diamonds)) and
    @cards_hand.include?(Card.new(9, :clubs))
  end

  def carre_of_aces?
    @cards_hand.include?(Card.new(:ace, :spades))   and
    @cards_hand.include?(Card.new(:ace, :hearts))   and
    @cards_hand.include?(Card.new(:ace, :diamonds)) and
    @cards_hand.include?(Card.new(:ace, :clubs))
  end
end

class SixtySixDeck < Deck
  DECK_SIZE = 24
  CARDS_IN_HAND = 6

  def initialize(cards = [])
    @ranks = [9, :jack, :queen, :king, 10, :ace]
    @ranks_ascending = Hash[(0...@ranks.size).zip @ranks]
    cards.empty? ? @cards = generate_all_cards(@ranks) : @cards = cards
  end

  def deal
    cards_hand = @cards[0..CARDS_IN_HAND - 1]
    @cards = @cards - cards_hand
    SixtySixDeckHand.new(cards_hand, @ranks_ascending)
  end
end

class SixtySixDeckHand < Hand
  def twenty?(trump_suit)
    temp = [:spades, :hearts, :diamonds, :clubs] - [trump_suit]
    pairs = temp.product([:queen, :king]).map { |s, r| Card.new(r, s) }
    cards_hand_combinations = @cards_hand.combination(2).to_a

    cards_hand_combinations.include?([pairs[0], pairs[1]]) or
    cards_hand_combinations.include?([pairs[2], pairs[3]]) or
    cards_hand_combinations.include?([pairs[4], pairs[5]])
  end

  def forty?(trump_suit)
    @cards_hand.combination(2).to_a.include?(
      [Card.new(:queen, trump_suit), Card.new(:king, trump_suit)])
  end
end
