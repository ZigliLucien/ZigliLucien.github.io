
    document.captureEvents(Event.KEYDOWN);      
    document.onkeydown = goKey; 

	function goKey(e) {

	 if( e.which==0x73) history.back();

	 if( e.which==0x74) document.forms[0].submit();

	 if( e.which==0x71) {
	 if(window.location.toString().slice(-7) == "?update" ) {
	  window.location =   window.location.toString().slice(0,-7)+"?home";
	  return;
	}

	 if(window.location.toString().slice(-5) == "?home" ) { 
			window.location.reload();
		} else {
		 	window.location = window.location+"?home";
		}
	}
	

	 if( String.fromCharCode(e.which)=="(") ; // ("DOWN");
	 if( String.fromCharCode(e.which)=="&") ; // ("UP");
	 if( String.fromCharCode(e.which)=="'") ; // ("RIGHT");
	 if( String.fromCharCode(e.which)=="%") ; // ("LEFT");
     }
