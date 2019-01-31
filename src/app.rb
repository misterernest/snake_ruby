require_relative 'view/Ruby2D'
require_relative 'model/state'
require_relative 'actions/actions'

# App is main class
class App
  def initialize
    @state = Model.initial_state
  end

  def start
    @view = View::Ruby2dView.new self
    timer_thread = Thread.new { init_timer @view } # Add a new thread, manage timer in parallel
    @view.start(@state)
    timer_thread.join
  end

  def init_timer(view)
    loop do
      if @state.game_finished
        puts 'Juego finalizado'
        puts "Puntaje: #{@state.snake.positions.length}"
        break
      end
      @state = Actions.move_snake(@state)
      view.render @state
      sleep 0.5
      # trigger movement
    end
  end

  def send_action(action, params)
    new_state = Actions.send action, @state, params
    return unless new_state.hash == @state.hash
    @state = new_state
    @view.render @state
  end
end

app = App.new
app.start
