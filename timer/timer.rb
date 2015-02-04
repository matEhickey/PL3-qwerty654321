
class Timer

	
	def initialise
		@accumulated = 0
		@elapsed = 0
	end	
	
    def start
        @start = Time.now
        @pause	= T#compte le temps de pause pause
        
        
        #    @mybutton.configure('text' => 'Stop')
        #    @mybutton.command { stop }
        #    @timer.start
    end
    
    def stop
        #    @mybutton.configure('text' => 'Start')
        #    @mybutton.command { start }
        #    @timer.stop
        @pause = Time.now
        @accumulated += @elapsed
    end
    
    def reset
        stop
        @accumulated, @elapsed = 0, 0
        @pause = 0
     	
    end
    
    def to_s
        @elapsed = Time.now - (@start-@pause)
        time = @accumulated + @elapsed
        h = sprintf('%02i', (time.to_i / 3600))
        m = sprintf('%02i', ((time.to_i % 3600) / 60))
        s = sprintf('%02i', (time.to_i % 60))
        mt = sprintf('%02i', ((time - time.to_i)*100).to_i)
        return "#{m}:#{s}"
        #    @mylabel.configure('text' => newtime)
    end
    
    def Timer.test
    	watch = Timer.new
	watch.start
	100000.times do
    		puts watch.to_s
    		
	end
	watch.stop
	
    end
    
end


#Timer.test
