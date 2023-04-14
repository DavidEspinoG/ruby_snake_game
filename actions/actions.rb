module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verificar que la siguiente casilla sea válida
    # si no es válida -> terminamos el juego
    # si es válida -> movemos la serpiente
    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
  end

  private

  def calc_next_position(state)
    current_position = state.snake.positions.first
    case state.next_direction
    when UP
      # decrementar fila
      return Model::Coord.new(
        current_position.row - 1,
        current_position.col)
    when RIGHT
      # incrementar columna
      return Model::Coord.new(
        current_position.row,
        current_position.col + 1)
    when DOWN
      # incrementar fila
      return Model::Coord.new(
        current_position.row + 1,
        current_position.col)
    when LEFT
      # decrementar columna
      return Model::Coord.new(
        current_position.row,
        current_position.col - 1)
    end
  end

  def position_is_valid? (state, next_position)
  end
end