	.text
	
bzero1:
	local.get 0
	i32.const 0
	i32.store8 0
	end_function
	
	
	
	
	
bzero2:
	local.get 0
	i32.const 0
	i32.store16 0:p2align=0
	end_function
	
	
	
	
	
bzero4:
	local.get 0
	i32.const 0
	i32.store 0:p2align=0
	end_function
	
	
	
	
	
bzero8:
	local.get 0
	i64.const 0
	i64.store 0:p2align=0
	end_function