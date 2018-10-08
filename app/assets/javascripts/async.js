asyncSearch = async function(e){
	await albumsNameSpace.search(e.target);
};

asyncDisplayAlbum = async function (min, max, refresh){
	await albumsNameSpace.displayAlbum(min, max, refresh);
};