<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Searching Information</title>
		<link rel="stylesheet" type="text/css" href="style.css" media = "screen"/>
		<script type="text/javascript" src="jquery-1.11.3.js"></script>

		<script type="text/javascript">
			window.onbeforeunload = function() {
    			//return "You have unsaved changes!";
				return null;
			}
		</script>

	</head>
	<body>
		<center>
		<table align = "center" width = "80%" id = "SearchingInfo">
			<tr>
				<td width = "30%">Submitted at</td>
				<td id = "submitTime">aaa</td>
			</tr>	
			<tr>
				<td>Current time</td>
				<td name = "currentTime">bbb</td>
			</tr>
			<tr>
				<td>Time since submission</td>
				<td name = "passedTime">ccc</td>
			</tr>
			<tr>
				<td>Searching status</td>
				<td name = "searchingStatus"></td>
			</tr>
			<!--<tr>
				<td>heading</td>
				<td name = "heading">ppp</td>
			</tr>
			<tr>
				<td>accessCount</td>
				<td name = "accessCount">qqq</td>
			</tr>-->			
		</table>
		
		The searching status will be automatically updated in every 1 second.<br>
		
		 <script type="text/javascript">
 			function backToEntry()
 			{
 				window.location.href = "/CasOT/SessionInvalidationServlet";
 			}
 		</script>
 		<br>
		<input type=button onclick='backToEntry()' value = "Exit the program">


		<!--<form name = "test" action = "CasOTServlet" method = "post">
			Test Servlet:<input type = "text" size = "18"><br>
			<input type = "submit" value = "Submit">
		</form>-->

		<h1>
			<%@ page import="java.util.*"%>
			<%
				Enumeration pNames=request.getParameterNames();
				while(pNames.hasMoreElements()){
    				String name=(String)pNames.nextElement();
    				String value=request.getParameter(name);
    				out.print(name + "=" + value);
				}
			%>
		</h1>
		<!--<%= request.getAttribute("mode") %>-->
		</center>

		<script type="text/javascript">
		start = new Date();
		//alert(window.SearchingInfo.rows[0].cells[1].innerHTML);
		//alert(document.getElementById("submitTime"));
		window.SearchingInfo.rows[0].cells[1].innerHTML = start.toString();
		
		function updateTime(){
			now = new Date();
			window.SearchingInfo.rows[1].cells[1].innerHTML = now.toString();
			time = (now.getTime() - start.getTime()) / 1000;
			time = Math.floor(time);
		
			//秒
			iS = time % 60;
			//分
			iM = Math.floor( time / 60);
			//时
			iH = Math.floor(iM / 60);

			if(iM < 10){
				if ( iS < 10)
					window.SearchingInfo.rows[2].cells[1].innerHTML = " " + iH + " : 0" + iM + " : 0" + iS;
				else
					window.SearchingInfo.rows[2].cells[1].innerHTML = " " + iH + " : 0" + iM + " : " + iS;
			}
			else{
				if ( iS < 10)
					window.SearchingInfo.rows[2].cells[1].innerHTML = " " + iH + " : " + iM + " : 0" + iS;
				else
					window.SearchingInfo.rows[2].cells[1].innerHTML = " " + iH + " : " + iM + " : " + iS;
			}
			
			setTimeout("updateTime()",1000);
		}
		updateTime();
		var User = {"UserID":11, "Name":{"FirstName":"Truly","LastName":"Zhu"}, "Email":"zhuleipro@hotmail.com"};
		console.log(User.Name.FirstName);
		</script>

		<script type="text/javascript">
			function testJSON(){
				//alert("In testJSON");
				// Using the core $.ajax() method
				$.ajax({
 				   // The URL for the request
 				   url: "CasOTServlet",				 
				    // The data to send (will be converted to a query string)
 				   data: {
 				       id: 123
				    },				 
				    // Whether this is a POST or GET request
 				   type: "GET", 
  				  // The type of data we expect back
  				  dataType : "json", 				
   				 // Code to run if the request succeeds;
   				 // the response is passed to the function
   				 success: function( json ) {
      				  //alert("In success");
      				  //console.log(json.Email);
      				  //document.getElementById("casotServlet").value = json.Date;
      				  if(json.searchingInfo == "Program finished"){
      				  	window.location.href = "resultPage.jsp";
      				  }else{
      				  	window.SearchingInfo.rows[3].cells[1].innerHTML = json.searchingInfo;
      				  	/*
      				  	window.SearchingInfo.rows[4].cells[1].innerHTML = json.heading;
      				  	window.SearchingInfo.rows[5].cells[1].innerHTML = json.accessCount;
      					*/
      					}
   				 },
   				 // Code to run if the request fails; the raw request and
   				 // status codes are passed to the function
   				 error: function( xhr, status, errorThrown ) {
     				   //alert( "Sorry, there was a problem!" );
     				   console.log( "Error: " + errorThrown );
     				   console.log( "Status: " + status );
     				   console.dir( xhr );
   				 }, 
   				 // Code to run regardless of success or failure
   				 complete: function( xhr, status ) {
				        //alert( "The request is complete!" );
				    }
				});
				setTimeout("testJSON()",1000);
			}
		</script>

		<script type="text/javascript">
			function sendOptions(){
				$.ajax({
 				   url: "CasOTServlet",				 
 				   data: {
 				       id: 123,
 				       mode: "<%= request.getAttribute("mode") %>",
 				       targetFile: "<%= request.getAttribute("targetFile") %>",
 				       genome: "<%= request.getAttribute("genome") %>",
 				       exon: "<%= request.getAttribute("exon") %>",
 				       output: "<%= request.getAttribute("output") %>",
 				       seed: "<%= request.getAttribute("seed") %>",
 				       nonseed: "<%= request.getAttribute("nonseed") %>",
 				       pam: "<%= request.getAttribute("pam") %>",
 				       distance: "<%= request.getAttribute("distance") %>",
 				       require5g: "<%= request.getAttribute("require5g") %>",
 				       lengthmin: "<%= request.getAttribute("lengthmin") %>",
 				       lengthmax: "<%= request.getAttribute("lengthmax") %>"
				    },				 
 				   type: "GET", 
  				  dataType : "json", 				
   				 success: function( json ) {
      				  window.SearchingInfo.rows[3].cells[1].innerHTML = json.searchingInfo;
      				  window.SearchingInfo.rows[4].cells[1].innerHTML = json.heading;
      				  window.SearchingInfo.rows[5].cells[1].innerHTML = json.accessCount;
   				 },
   				 error: function( xhr, status, errorThrown ) {
     				   console.log( "Error: " + errorThrown );
     				   console.log( "Status: " + status );
     				   console.dir( xhr );
   				 }, 
   				 complete: function( xhr, status ) {
				    }
				});
				setTimeout("testJSON()",1000);
			}
			sendOptions();
		</script>		


	</body>
</html>