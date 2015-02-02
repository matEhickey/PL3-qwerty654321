
class Stopwatch
    def start
        @accumulated = 0 unless @accumulated
        @elapsed = 0
        @start = Time.now
        #    @mybutton.configure('text' => 'Stop')
        #    @mybutton.command { stop }
        #    @timer.start
    end
    
    def stop
        #    @mybutton.configure('text' => 'Start')
        #    @mybutton.command { start }
        #    @timer.stop
        @accumulated += @elapsed
    end
    
    def reset
        stop
        @accumulated, @elapsed = 0, 0
        #    @mylabel.configure('text' => '00:00:00.00.000')
    end
    
    def tick
        @elapsed = Time.now - @start
        time = @accumulated + @elapsed
        h = sprintf('%02i', (time.to_i / 3600))
        m = sprintf('%02i', ((time.to_i % 3600) / 60))
        s = sprintf('%02i', (time.to_i % 60))
        mt = sprintf('%02i', ((time - time.to_i)*100).to_i)
        ms = sprintf('%04i', ((time - time.to_i)*10000).to_i)
        ms[0..0]=''
        newtime = "#{h}:#{m}:#{s}.#{mt}.#{ms}"
        #    @mylabel.configure('text' => newtime)
    end
end


watch = Stopwatch.new
watch.start
1000000.times do
    puts watch.tick
end
