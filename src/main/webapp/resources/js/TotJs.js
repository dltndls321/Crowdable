
    $.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || "");
            } else {
                o[this.name] = this.value || "";
            }
        });
        return o;
     };	

function nevi_open() {
	document.getElementById("mySidebar_left").style.display = "block";
	document.getElementById("myOverlay").style.display = "block";	
}

function nevi_close() {
	document.getElementById("mySidebar_left").style.display = "none";
	document.getElementById("myOverlay").style.display = "none";
}


function login_click(){
	document.getElementById("login_items").style.display="block";
	document.getElementById("register_Items").style.display="none";
	
}
function register_click(){
	
}




