require 'ruby2d'
require_relative 'custom_figure'

set background: 'navy'
set title: 'Shot me'
set width: 1200
set height: 800

message = Text.new('Click to begin')
game_started = false
figure_group = nil
start_time = nil
duration = nil

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  if game_started
    figure_group.each do |figure_part|
      if figure_part.contains?(event.x, event.y)
        duration = ((Time.now - start_time) * 1000).round
        message = Text.new("You took: #{duration} milliseconds!", color: 'white')
        figure_group.each(&:remove)
        game_started = false
      end
    end
  else
    message.remove

    figure_group = create_figure
    figure_group.each(&:add)

    start_time = Time.now
    game_started = true
  end
end

show
