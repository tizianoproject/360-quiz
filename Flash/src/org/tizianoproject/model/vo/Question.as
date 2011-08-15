// ActionScript file
class org.tizianoproject.model.vo.Question{
	
	public var question:String;
	public var info:String;
	public var key:String;
	public var options:Array;
	
	function Question( q:String, i:String, k:String, o:Array ){	
		/*
		trace( q );
		trace( a );
		trace( k );
		trace( o );
		trace( "~~~~~~~~~~~~~~~~~~~~~" );
		*/
		question	= q;
		info		= i;
		key			= k;
		options		= o;
	}
}