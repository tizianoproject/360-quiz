class org.tizianoproject.utils.CountDown extends MovieClip{
	public var mc:MovieClip;
	public var duration:Number;
	public var countDuration:Number;
	public var countStartTime:Number;
	public var tc:String;
	public var timer_txt:TextField;
	public var end:Function;
	
	function CountDown(mc:MovieClip, duration:Number, displayTime:String)
	{
		this.mc = mc;
		mc.duration = duration;
		mc.timer_txt.text = displayTime;
				
		mc.countDuration = duration;
		mc.countStartTime = getTimer();
		mc.tc = new String("");
	}
	public function start():Void
	{
		mc.onEnterFrame = getCountDown;	
	}

	public function stop():Void
	{
		delete mc.onEnterFrame;
	}
	
	public function stopCountdown(){
		trace( "1");
		_root.endTime(this);
	}
	
	private function getCountDown():Void
	{
		var countTimeLeft:Number;
		var sec:Number;
		var min:Number;
		
		countTimeLeft = countDuration - (getTimer() - countStartTime);
		if (countTimeLeft <= 0)
		{
			this.timer_txt.text = "00:00";
			this.onEnterFrame = null;
//			stopCountdown();
			_root.endTime(this);
			
			tc = "00:00";
		} else {
			var secondsLeft:Number = Math.ceil(countTimeLeft / 1000);

			//a. format for anything < 10min
			if (secondsLeft < 600)
			{
				tc = "0";
			}
			//b. format for anything > 60sec          
			if (secondsLeft >= 60)
			{
				min = Math.floor(secondsLeft / 60);
				sec = secondsLeft % 60;
				tc += min.toString();
			} else
			{
				sec = secondsLeft % 60;
				tc += "0";
			}
			tc += ":";
			//c. format for anything below 10sec
			if (sec < 10)
			{
				tc += "0";
				tc += sec.toString();
			} else
			{
				tc += sec.toString();
			}
			this.timer_txt.text = tc;
		}
	}
}