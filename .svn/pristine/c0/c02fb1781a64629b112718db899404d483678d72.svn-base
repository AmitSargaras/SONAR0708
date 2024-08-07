// JavaScript Document

// Author: Jimmy Wong	Date: 30 April, 2003
// This script requires itgUserStore.js to be available.

// helper function
function toNumber(value) {
	var pattern = /[,]*/g;
	return new Number(parseFloat(value.replace(pattern,"")));
}

function scbStockPrice(storeHandle) {
	this.pStoreName = "fSCBStockPrice";
	this.pStoreHandle = storeHandle;
	this.pUserStore = null;
	this.pDataLoaded = false;
	
	function save() {
		this.pUserStore = new itgUserStore(this.pStoreName);
		var objs = document.getElementsByTagName("INPUT");
		this.pUserStore.save(this.pStoreHandle, objs);
	}
	scbStockPrice.prototype.save = save;
	function load() {
		this.pUserStore = new itgUserStore(this.pStoreName);
		var objs = document.getElementsByTagName("INPUT");		
		this.pUserStore.load(this.pStoreHandle, objs);
	}
	scbStockPrice.prototype.load = load;
	function getStockPrice(ticker) {
		return toNumber(this.pUserStore.getAttribute(ticker));
	}
	scbStockPrice.prototype.getStockPrice = getStockPrice;
	/*
	function isStockPriceLoaded() {
		return this.pDataLoaded;
	}
	scbStockPrice.prototype.isStockPriceLoaded = isStockPriceLoaded; */
}