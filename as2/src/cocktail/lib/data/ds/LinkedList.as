/**
 * example:
 
var list:LinkedList;
var walker:Node;
var data:Object;

list = new LinkedList();
list.push(3);
list.push(4);

walker = list.head;
do {
	data = walker.data;
	trace(data);
} while( walker = walker.next );

* will output:

1
2
3
4
 */

import cocktail.lib.data.ds.Node;

class cocktail.lib.data.ds.LinkedList {

	public var head:Node;
	public var tail:Node;
	
	private var _length:Number;
	
	public function LinkedList (items:Array) { 
		this._length = 0;
		while(items[0] != undefined && this.append( items.shift() ) );
	}
	/**
	 * Adds one element to the end of the list
	 * @param	data
	 */
	public function append (data : Object) : Node {
		var node:Node;
		
		node = new Node(data);
		
		if(!this.head) {
			this.head = node;
			this.tail = node;
			this._length ++;
			return node;
		}
		
		if(!this.head.next) {
			this.head.next = node;
		}
		
		this.tail.next = node;
		this.tail = node;
		this._length ++;
		
		return node;
	}
	
	/**
	 * Adds one element to the beginning of the list
	 * @param	data
	 */
	public function unshift (data:Object) : Node {
		var node:Node;
		
		node = new Node(data);
		
		node.next = this.head;
		this.head = node;
		this._length ++;
		
		return node;
	}
	
	/**
	 * Insert newNode after node
	 * @param	node
	 * @param	newNode
	 */
	public function insertAfter (node:Node, data:Object) : Node {
		var newNode:Node;
		
		newNode = new Node(data);
		newNode.next = node.next;
		node.next = newNode;
		this._length ++;
		
		return newNode;
	}
	
	/**
	 * Remove the first element after node
	 * @param	node
	 * @return	removed node
	 */
	public function removeAfter (node:Node) : Node {
		var nextNode:Node;
		
		nextNode = node.next;
		node.next = nextNode.next;
		
		this._length --;
		
		return nextNode;
	}
	
	public function remove (node:Node) : Void {
		var walker:Node;
		var prevNode:Node;
		
		walker = this.head;
		
		do {
			if(walker == node){
				if(node == this.head) {
					head = node.next;
					break;
				}
				
				if(node == this.tail) {
					prevNode.next = undefined;
					this.tail = prevNode;
					break;
				}
				
				prevNode.next = walker.next;
				
				this._length --;
				
				break;
			}
			
			prevNode = walker;
		} while (walker = walker.next);
	}

	/**
	 * Execute desired action, passing (data, node) as args
	 * @param	action	function that will receive each data/node
	 * @param	scope	function's scope
	 * @param	head	node to start the lambda (default is list.head)
	 */
	public function each (action:Function, scope:Object, head:Node) : Void {
		if(! this._length) return;
		
		var walker:Node = head || this.head;
		
		do {
			if(scope) {
				action.apply(scope, [walker.data, walker]);
			} else {
				action(walker.data, walker);
			}
		} while (walker = walker.next);
	}
	
	/**
	 * Execute desired action passing params. in all datas
	 * @param	action	function that will receive each data/node
	 * @param	params	function params
	 * @param	head	node to start the lambda (default is list.head)
	 */
	public function deach (action : Function, params : Object, head:Node) : Void {
		if(! this._length) return;
		
		var walker:Node = head || this.head;
		
		do {
			action.apply(walker.data, [].concat(params));
		} while (walker = walker.next);		
	}
	
	/**
	 * Clear the linked list references to nodes
	 * @return
	 */
	public function clear () : Boolean {
		//TODO: check if we can use a more garbage collector friendly routine
		if (! this.length) return false;
		
		this.head = null;
		this.tail = null;
		this._length = 0;
	}
	
	public function get length () : Number {
		return this._length;
	}
}