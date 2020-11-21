class Player

  def initialize(one, two)
    @p1 = one
    @p2 = two
  end

  def swap_player(player)
    player == @p1 ? @p2 : @p1
  end

end
