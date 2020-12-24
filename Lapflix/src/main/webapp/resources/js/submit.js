$(function () {
	    $('.submitBtn').click(function(){
	    	var laptop_MonitorSize = $("input[type=radio][name=laptop_MonitorSize]:checked").val();
	    	var laptop_OS = $("input[type=radio][name=laptop_OS]:checked").val();
	    	var program_Name = $("input[type=radio][name=program_Name]:checked").val();
	    	var status = $("input[type=radio][name=status]:checked").val();
	    	var laptop_Weight = $("input[type=radio][name=laptop_Weight]:checked").val();
	    	var laptop_Price = $("input[type=radio][name=laptop_Price]:checked").val();
			
			sessionStorage.setItem("laptop_MonitorSize", laptop_MonitorSize);
			sessionStorage.setItem("laptop_OS", laptop_OS);
			sessionStorage.setItem("program_Name", program_Name);
			sessionStorage.setItem("status", status);
			sessionStorage.setItem("laptop_Weight", laptop_Weight);
			sessionStorage.setItem("laptop_Price", laptop_Price);
			
	    	location.href= "result?laptop_MonitorSize="+laptop_MonitorSize+"&laptop_OS="+laptop_OS+
							"&program_Name="+program_Name+"&status="+status+"&laptop_Weight="+laptop_Weight+"&laptop_Price="+laptop_Price;
	    });
	
	});