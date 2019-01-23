module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verficar si la siguiente casilla es valida para terminar o continuar el juego
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
      Model::Cord.new(current_position.row - 1, current_position.col)
    when DOWN
      Model::Cord.new(current_position.row + 1, current_position.col)
    when RIGHT
      Model::Cord.new(current_position.row, current_position.col + 1)
    when LEFT
      Model::Cord.new(current_position.row, current_position.col - 1)
    end
  end

  def position_is_valid
    # ...
  end
end
