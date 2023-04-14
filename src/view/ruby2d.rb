require "ruby2d"
require_relative "../model/state.rb"
module View
  class Ruby2dView
    def initialize(app)
      @pixel_size = 40
      @app = app
    end

    def start(state)
      extend Ruby2D::DSL
      set(
        title: "Snake",
        width: @pixel_size * state.grid.cols, 
        height: @pixel_size * state.grid.cols)
      on :key_down do |event|
        handle_key_event(event)
      end
      show 
    end

    def renderGame(state)
      extend Ruby2D::DSL
      clear
      render_food(state)
      render_snake(state)
    end

    private

    def render_food(state)
      extend Ruby2D::DSL
      food = state.food
      Square.new(
        x: food.col * @pixel_size,
        y: food.row * @pixel_size, 
        size: @pixel_size,
        color: 'yellow',
      )
    end

    def render_snake(state)
      extend Ruby2D::DSL
      snake = state.snake
      snake.positions.each do |pos|
        Square.new(
          x: pos.col * @pixel_size,
          y: pos.row * @pixel_size, 
          size: @pixel_size,
          color: 'red',
        )
      end
    end

    def handle_key_event(event)
      case event.key 
      when "up"
        @app.send_action(:change_direction, Model::Direction::UP)
      when "down"
        @app.send_action(:change_direction, Model::Direction::DOWN)
      when "left"
        @app.send_action(:change_direction, Model::Direction::LEFT)
      when "right"
        @app.send_action(:change_direction, Model::Direction::RIGHT)
      end
    end
  end
end