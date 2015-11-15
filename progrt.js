var progrt = {};
progrt.toggle = function(){
	var container = document.getElementById("container");
	
	if (container.classList.contains("collapsed")) {
		container.classList.remove("collapsed");
	}
	else {
		container.classList.add("collapsed");
	}
}
