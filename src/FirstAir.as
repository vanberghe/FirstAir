package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.AccelerometerEvent;
	import flash.events.GeolocationEvent;
	import flash.events.StageOrientationEvent;
	import flash.sensors.Accelerometer;
	import flash.sensors.Geolocation;
	import flash.system.Capabilities;
	
	public class FirstAir extends Sprite
	{
		public function FirstAir()
		{
			super()
			var width:Number = Math.max(stage.fullScreenWidth,stage.fullScreenHeight);
			var height:Number = Math.min(stage.fullScreenWidth,stage.fullScreenHeight);
			trace("width: " + width + " & height: " + height);
			
			// om de schermresolutie te tonen
			Capabilities.screenDPI;
			trace ("DPI: " + Capabilities.screenDPI);
			//
			trace("CPU: " + Capabilities.cpuArchitecture);
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			stage.addEventListener(StageOrientationEvent.ORIENTATION_CHANGING, orientationChangeHandler);
			
			//ACCELEROMETER AANSPREKEN
			if(Accelerometer.isSupported){
				var accSensor:Accelerometer = new Accelerometer();
				accSensor.addEventListener(AccelerometerEvent.UPDATE, accUpdateHanler);	
			}
			
			//GEOLOCATIE!
			if(Geolocation.isSupported){
				var geoSensor:Geolocation = new Geolocation();
				geoSensor.addEventListener(GeolocationEvent.UPDATE, geoUpdateHandler);	
			}
				
		}
		
		protected function geoUpdateHandler(event:GeolocationEvent):void
		{
			// TODO Auto-generated method stub
			trace(event.latitude + " -- " + event.altitude + " -- " + event.longitude);
		}		
		
		protected function accUpdateHanler(event:AccelerometerEvent):void
		{
			// TODO Auto-generated method stub
		/*	trace("x: " + event.accelerationX);
			trace("y: " + event.accelerationY);
			trace("z: " + event.accelerationZ);*/
		}
		
		protected function orientationChangeHandler(event:StageOrientationEvent):void
		{
			// TODO Auto-generated method stub
			trace("voordien: " + event.beforeOrientation + " nadien: " + event.afterOrientation);
		}
	}
}