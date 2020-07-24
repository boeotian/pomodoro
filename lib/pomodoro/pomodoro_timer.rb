require 'yaml'
require 'timers'

module Pomodoro
  class PomodoroTimer
    def initialize(config_path="~/.pomodoro/config.yaml")
      if File.exist?(config_path) do
        @cfg = YAML.load_file(config_path)
      end

      @pomodoro_length = @cfg.pomodoro_length
      @pomodoro_short = @cfg.pomodoro_short
      @pomodoro_long = @cfg.pomodoro_long
      @pomodoro_count = @cfg.pomodoro_count
    
      @timers = Timers::Group.new
    end

    def start()
      delta = 0
      pd = @timers.every(@pomodoro_length * 60) {
        unless delta == 4 
          @timers.wait(@pomodoro_short * 60)
          delta += 1
        else
          @timers.wait(@pomodoro_long * 60)
          delta = 0
        end
      }
    end
  end
end