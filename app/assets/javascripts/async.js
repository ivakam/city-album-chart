asyncSearch = async function(e){
	//console.log($(e))
	await albumsNameSpace.search(e.target);
	//console.log("tried async")
}

asyncDisplayAlbum = async function (min, max, refresh){
	await albumsNameSpace.displayAlbum(min, max, refresh);
}