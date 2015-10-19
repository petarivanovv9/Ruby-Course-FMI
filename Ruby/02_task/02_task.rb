def get_position_ahead(snake_head, direction)
  snake_head.map.with_index { |m, i| m + direction[i] }
end

def move(snake, direction)
  snake.drop(1) << get_position_ahead(snake[-1], direction)
end

def grow(snake, direction)
  snake.drop(0) << get_position_ahead(snake[-1], direction)
end

def new_food(food, snake, dimensions)
  taken_fields = food + snake
  widths = (0..dimensions[:width] - 1).to_a
  heights = (0..dimensions[:height] - 1).to_a
  all_fields = widths.product(heights)
  all_fields.select { |v| !taken_fields.include?(v) }.sample
end

def position_in_bounds?(new_snake, dimensions)
  ((new_snake.first >= dimensions[:width] or new_snake.first < 0) or
  (new_snake.last >= dimensions[:height] or new_snake.last < 0)) ? true : false
end

def obstacle_ahead?(snake, direction, dimensions)
  new_position = get_position_ahead(snake[-1], direction)
  (snake.include?(new_position) or
  position_in_bounds?(new_position, dimensions)) ? true : false
end

def danger?(snake, direction, dimensions)
  new_position_1 = get_position_ahead(snake[-1], direction)
  new_position_2 = get_position_ahead(new_position_1, direction)
  (position_in_bounds?(new_position_1, dimensions) or
   position_in_bounds?(new_position_2, dimensions)) ? true : false
end
