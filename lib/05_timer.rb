class Timer
    def time_string(seconds)
      hours = seconds / 3600
      seconds -= hours * 3600
      minutes = seconds / 60
      seconds -= minutes * 60
      "%02d:%02d:%02d" % [hours, minutes, seconds]
    end
  end
  

  # timer_spec.rb
require_relative './lib/05_timer'

describe Timer do
  describe '#time_string' do
    it "should display 0 seconds as 00:00:00" do
      timer = Timer.new
      expect(timer.time_string(0)).to eq("00:00:00")
    end

    it "should display 12 seconds as 00:00:12" do
      timer = Timer.new
      expect(timer.time_string(12)).to eq("00:00:12")
    end

    it "should display 66 seconds as 00:01:06" do
      timer = Timer.new
      expect(timer.time_string(66)).to eq("00:01:06")
    end

    it "should display 4000 seconds as 01:06:40" do
      timer = Timer.new
      expect(timer.time_string(4000)).to eq("01:06:40")
    end
  end
end