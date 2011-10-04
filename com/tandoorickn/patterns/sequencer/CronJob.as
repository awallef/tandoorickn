package com.tandoorickn.patterns.sequencer
{
	import flash.utils.clearInterval;
	import flash.utils.setInterval;

	public class CronJob
	{
		public var 	id				:uint,
					note			:Object,
					counter			:uint,
					closure			:Function,
					delay			:Number,
					stopCount		:int,
					labelOrName		:String,
					isRunning		:Boolean;
					
		
		public function CronJob(closure:Function, labelOrName:String, delay:Number, note:Object = null, stopCount:int = -1)
		{
			this.closure = closure;
			this.labelOrName = labelOrName;
			this.delay = delay;
			this.note = note;
			this.stopCount = stopCount;
			this.counter = 0;
		}
		
		public function start():void
		{
			this.isRunning = true;
			this.id = setInterval(tick,delay);
		}
		
		private function tick():void
		{
			if(stopCount < 0 )
			{
				closure(labelOrName,note);
				return;
			}
			counter++;
			closure(labelOrName,note);
			
			if(counter == stopCount)
				clearInterval(id);    
				
		}
		
		public function stop():void
		{
			this.counter = 0;
			clearInterval(this.id);
			this.isRunning = false;
		}
		
		public function destroy():void
		{
			stop();
			this.closure = null;
			this.labelOrName = null;
			this.delay = 0;
			this.note = null;
			this.stopCount = 0;
			this.counter = 0;
		}
	}
}