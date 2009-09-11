package org.ghostcat.ui
{
	import flash.display.DisplayObject;
	
	import org.ghostcat.util.ClassFactory;
	import org.ghostcat.ui.controls.GText;
	import org.ghostcat.skin.ArowSkin;
	
	/**
	 * IToolTipSkin的默认实现
	 * 
	 * @author flashyiyi
	 * 
	 */
	public class ToolTipSkin extends GText implements IToolTipSkin
	{
		public static var defaultSkin:ClassFactory = new ClassFactory(ArowSkin);
		
		public function ToolTipSkin(skin:DisplayObject=null)
		{
			if (!skin)
				skin = defaultSkin.newInstance();
			super(skin);
		
			this.enabledAdjustContextSize = true;
		}
		
		public function positionTo(target:DisplayObject):void
		{
			var toolTipSprite:ToolTipSprite = this.parent as ToolTipSprite;
			toolTipSprite.x = toolTipSprite.parent.mouseX + 15;
			toolTipSprite.y = toolTipSprite.parent.mouseY + 15;
		}
	}
}