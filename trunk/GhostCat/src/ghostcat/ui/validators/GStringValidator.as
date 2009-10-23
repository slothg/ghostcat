package ghostcat.ui.validators
{
	import flash.events.Event;
	import flash.geom.Point;
	
	import ghostcat.text.TextUtil;
	
	/**
	 * 正则数据验证器 
	 * 
	 * @author flashyiyi
	 * 
	 */
	public class GStringValidator extends GValidator
	{
		public static var defaultTooLongError:String = "数据格式不符合要求";
		public static var defaultTooShortError:String = "数据格式不符合要求";
		
		/**
		 * 最小值
		 */
		public var minLength:Number;
		
		/**
		 * 最大值
		 */
		public var maxLength:Number;
		
		/**
		 * 中文是否按两个字符处理
		 */
		public var isANSI:Boolean = false;
		
		private var _tooLongError:String;
		private var _tooShortError:String;

		/**
		 * 长度太长的提示信息
		 */
		public function get tooLongError():String
		{
			if (_tooLongError)
				return _tooLongError;
			else
				return defaultTooLongError;
		}

		public function set tooLongError(value:String):void
		{
			_tooLongError = value;
		}
		
		/**
		 * 长度太短时的提示信息
		 */
		public function get tooShortError():String
		{
			if (_tooShortError)
				return _tooShortError;
			else
				return defaultTooShortError;
		}
		
		public function set tooShortError(value:String):void
		{
			_tooShortError = value;
		}

		
		public function GStringValidator(skin:*=null, source:Object=null, property:String=null, minLength:Number = NaN, maxLength:Number = NaN, replace:Boolean=true, separateTextField:Boolean=false, textPos:Point=null)
		{
			this.minLength = minLength;
			this.maxLength = maxLength;
			
			super(skin, source, property, replace, separateTextField, textPos);
		}
		/** @inheritDoc*/
		protected override function triggerHandler(event:Event) : void
		{
			super.triggerHandler(event);
			
			var len:int = isANSI ? TextUtil.getANSILength(data) : data.toString().length;
			
			var v:* = source[property];
			if (!isNaN(minLength) && len < minLength)
			{
				this.data = tooShortError;
				return;
			}
			if (!isNaN(maxLength) && len > maxLength)
			{
				this.data = tooLongError;
				return;
			}
		}
	}
}