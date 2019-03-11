package ssen.component.checkBox 
{
	import ssen.component.base.IComponent;
	import ssen.core.display.ISkinObject;
	import ssen.data.selectGroup.ISelectItem;		
	/**
	 * @author SSen
	 */
	public interface ICheckBoxItem extends IComponent, ISkinObject 
	{
		function get data() : ISelectItem
		function set data(data : ISelectItem) : void
	}
}
