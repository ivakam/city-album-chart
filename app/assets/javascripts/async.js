asyncSearch = async function(e){
	//console.log($(e))
	await albumsNameSpace.search(e.target);
	//console.log("tried async")
}

asyncDisplayAlbum = async function (i, refresh){
	await albumsNameSpace.displayAlbum(i, refresh);
}