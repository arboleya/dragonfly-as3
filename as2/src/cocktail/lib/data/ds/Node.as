class cocktail.lib.data.ds.Node {

	public var data:Object;
	public var next:Node;
	
	public function Node(data:Object) {
		this.setData(data);
	}
	
	private function setData(data:Object) : Void {
		this.data = data;
	}
}