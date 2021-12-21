var join = {
	tag_status: function(tag){
		console.log('어디서작동하는데?');
		var data = tag.val();
		tag = tag.attr('name');
		if( tag == 's_order_pw') data = this.pw_status(data);
		
	return data;
	},
	
	pw_status: function(pw){
		var i = "이이";
		var k = "꺼";
		
		if(pw == '') return i;
		else if (pw == '123') return k; 
	}
	
};