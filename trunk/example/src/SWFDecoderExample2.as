package 
{
	import flash.display.Sprite;
	import flash.net.URLLoaderDataFormat;
	import flash.utils.ByteArray;
	
	import org.ghostcat.events.OperationEvent;
	import org.ghostcat.fileformat.swf.SWFDecoder;
	import org.ghostcat.fileformat.swf.SWFSelf;
	import org.ghostcat.fileformat.swf.tag.DebugIDTag;
	import org.ghostcat.fileformat.swf.tag.ProductInfoTag;
	import org.ghostcat.operation.LoadOper;
	
	/**
	 * SWF二进制代码解析（这几个Tag只有FLEX编译的文件才有）
	 * 
	 * @author Administrator
	 * 
	 */
	public class SWFDecoderExample2 extends Sprite
	{
		public var swfDecoder:SWFDecoder;
		public function SWFDecoderExample2()
		{
			new SWFSelf(this,rhandler);
		}
		
		private function rhandler(bytes:ByteArray):void
		{
			swfDecoder = new SWFDecoder(bytes);
			
			trace(swfDecoder.getTags(ProductInfoTag)[0].toString());
			trace(swfDecoder.getTags(DebugIDTag)[0].toString());
		}
	}
}