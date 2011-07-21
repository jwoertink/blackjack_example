class Card
  
  def initialize(name, value)
    @name = name
    @value = value
  end
  
  def name
    @name
  end
  
  def value
    @value
  end
  
  def ==(other)
    return true if name.eql?(other.name) and value.eql?(other.value)
  end
  
  def shown?
    true
  end
  
end

class Dealer
  
  def initialize(deck)
    @deck = deck
  end
  
  def deck
    @deck
  end
  
  def shuffle
    @deck = Deck.new(deck.cards.sort_by { rand })
  end
  
  def hit
    
  end
  
  def stay
    
  end
  
  def deal(player)
    card = @deck.cards.first
    player.hand << card
    @deck.remove_card(card)
  end
  
end

class Player
  
  def initialize
    @hand = []
  end
  
  def hand
    @hand
  end
  
  def hit
    
  end
  
  def stay
    
  end
  
end

class Deck
  
  def initialize(cards)
    @cards = cards
  end
  
  def cards
    @cards
  end
  
  def remove_card(card_a)
    @cards.delete_if { |card_b| card_a == card_b }
  end
  
end


@suites = ["C", "S", "D", "H"]
@numbers = (1..9).to_a + ["J", "Q", "K", "A"]
@cards = []
@individual_cards = []
@suites.each do |suite|
  @numbers.each do |number|
    @cards << "#{number}#{suite}"
  end
end

@cards.each do |card|
  if /^(K|Q|J)/ =~ card
    value = 10 
  elsif /^(A)/ =~ card
    value = 11
  else
    value = card.to_i
  end
  @individual_cards << Card.new(card, value)
end

@deck = Deck.new(@individual_cards)

@dealer = Dealer.new(@deck)

@player_one = Player.new



