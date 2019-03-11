package ssen.component.list 
{
	import ssen.component.base.IComponent;
	import ssen.core.display.ISkinObject;
	import ssen.data.selectGroup.ISelectItem;		
	/**
	 * @author SSen
	 */
	public interface IListItem extends IComponent, ISkinObject
	{
		function get data() : ISelectItem
		function set data(data : ISelectItem) : void
		function get prevItem() : IListItem
		function get nextItem() : IListItem
	}
}
