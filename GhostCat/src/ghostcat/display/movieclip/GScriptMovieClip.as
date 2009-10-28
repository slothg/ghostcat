package ghostcat.display.movieclip
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import ghostcat.util.core.Handler;

	/**
	 * 使用动画剪辑模拟代码动画，可以再次继承此类来来处理特殊情况
	 * 
	 * @author flashyiyi
	 * 
	 */	
	
	public class GScriptMovieClip extends GMovieClipBase
	{
		/**
		 * 渲染方法，参数为GScrpitMovieClip本身
		 */
		public var command:Handler;
		
		/**
		 * 代码动画的虚拟大小
		 */
		public var bounds:Rectangle;
		
		/**
		 * 
		 * @param cmd	渲染方法
		 * @param totalFrames	动画长度
		 * @param labels	标签数组，内容为FrameLabel类型
		 * @param paused	是否暂停
		 * 
		 */	
		public function GScriptMovieClip(command:*,totalFrames:int,labels:Array=null,bounds:Rectangle = null,paused:Boolean=false)
		{
			if (command is Function)
				command = new Handler(command);
			
			super(new Sprite(),true,paused);
			
			this.command = command;
			this._totalFrames = totalFrames;
			this._labels = labels ? labels : [];
			this.bounds = bounds;
			
			reset();
		}
        /** @inheritDoc*/
        public override function set currentFrame(frame:int):void
        {
        	if (frame < 1)
        		frame = 1;
        	if (frame > totalFrames)
        		frame = totalFrames;
        	
        	if (_currentFrame == frame)
        		return;
        		
        	_currentFrame = frame;
        
        	command.call(this);
			
			super.currentFrame = frame;
		}
        
        public function set totalFrames(v:int):void
        {
        	_totalFrames = v;
        }
        
		public function set labels(v:Array):void
        {
        	_labels = v;
        }
		
		public override function destory():void
		{
			if (destoryed)
				return;
			
			if (command)
				command.destory();
			
			super.destory();
		}
	}
}