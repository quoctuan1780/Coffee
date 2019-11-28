<?php

namespace App;

class Cart
{
	public $items = null;
	public $totalQty = 0;
	public $totalPrice = 0;

	public function __construct($oldCart){
		if($oldCart){
			$this->items = $oldCart->items;
			$this->totalQty = $oldCart->totalQty;
			$this->totalPrice = $oldCart->totalPrice;
		}
	}

	public function add($item, $id){
		if($item->promotion_price == 0){
			$giohang = ['qty'=>0, 'price' => $item->unit_price, 'item' => $item];
		}
		else{
			$giohang = ['qty'=>0, 'price' => $item->promotion_price, 'item' => $item];
		}
		if($this->items){
			if(array_key_exists($id, $this->items)){
				$giohang = $this->items[$id];
			}
		}
		$giohang['qty']++;
		$this->totalQty++;
		$this->items[$id] = $giohang;
		if($item->promotion_price == 0){
			$giohang['price'] = $item->unit_price * $giohang['qty'];
			$this->totalPrice += $item->unit_price;
		}
		else{
			$giohang['price'] = $item->promotion_price * $giohang['qty'];
			$this->totalPrice += $item->promotion_price;
		}
	}
	//xóa 1
	public function reduceByOne($id){
		$this->items[$id]['qty']--;
		$this->items[$id]['price'] -= $this->items[$id]['item']['price'];
		$this->totalQty--;
		$this->totalPrice -= $this->items[$id]['item']['price'];
		if($this->items[$id]['qty']<=0){
			unset($this->items[$id]);
		}
	}
	//xóa nhiều
	public function removeItem($id){
		$this->totalQty -= $this->items[$id]['qty'];
		$this->totalPrice -= $this->items[$id]['price']*$this->items[$id]['qty'];
		unset($this->items[$id]);
	}
}
