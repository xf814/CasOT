<html>

	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Searching Result</title>
		<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
	</head>

	<body>
		<center>
		<h1>Searching Result</h1>
		<%/*=session.getAttribute("accessCount").toString()*/%>
		<script type="text/javascript">
    		function download() {
        		var result_location = "casot_result/" + 
        		"<%=request.getSession(true).getId() %>" + 
        		"/result.zip";
        		//alert(result_location);
        		window.location.href = result_location;
    		}
		</script>

		<!--<script type="text/javascript">
			window.onbeforeunload = function(){
				return "aa";
			}
		</script>-->

		<%@ page language="java" %>
		<%@ page import="java.io.*" %>
		<%@ page import="Zip.*" %>
		<%@ page import="java.util.HashMap" %>
		<%@ page import="java.util.Iterator" %>
		<%@ page import="java.util.Map" %>
		<%@ page import="java.util.Map.Entry" %>
		<%@ page import="java.util.Arrays" %>

		<%
			String sessionID = request.getSession(true).getId();
			String resultPath = "/home/xiongf/tomcat/webapps/CasOT/casot_result/";
			new testZip(resultPath + "/" + sessionID + "/result",
				resultPath + "/" + sessionID + "/result.zip");
			//FileReader fr = new FileReader("e:\\_stat.txt");
			FileReader fr = new FileReader(resultPath + "/" + sessionID + "/result/result_stat/_stat.txt");
			BufferedReader br = new BufferedReader(fr);
			String result_line = "";
			HashMap<String,HashMap<String,String>> ot_stat = new HashMap<String,HashMap<String,String>>();
			HashMap<String,String> stat_of_current_ot = new HashMap<String,String>();
			String current_target_name = "";
			while((result_line = br.readLine())!=null){
				if(result_line.contains("Summary"))
					break;
				if(result_line.contains("---")){
					String[] tmp = result_line.split(" ");
					current_target_name = tmp[1];
				//target_names.add(current_target_name);				
				}
				if(result_line != ""){
					if(!ot_stat.containsKey(current_target_name)){
						stat_of_current_ot = new HashMap<String,String>();
					}else{
						stat_of_current_ot = ot_stat.get(current_target_name);
					}
					String[] tmp = result_line.split("\t");
					if(tmp.length > 1)
						stat_of_current_ot.put(tmp[0], tmp[1]);
					if(!current_target_name.equals("")){
						ot_stat.put(current_target_name, stat_of_current_ot);
					}
				}
			
			}
		
			br.close();
			fr.close();
		
			Iterator<Entry<String, HashMap<String, String>>> outer_iter = ot_stat.entrySet().iterator();
			Iterator<Entry<String, String>> inner_iter;
			while(outer_iter.hasNext()){
				Map.Entry<String, HashMap<String,String>> outer_entry = (Map.Entry<String, HashMap<String,String>>)outer_iter.next();
				out.println("<b>" + outer_entry.getKey() + "</b>");
				out.println("<table width=\"50%\">");
				out.println("<tr><td>PAM Type</td><td width=\"20%\">Number of Mismatches in 	Seed Region</td>" + "<td width=\"20%\">Number of Mismatches in Non-seed Region" + "<td>Number of Off-target Sites Found</td></tr>");
				HashMap<String,String> inner_hashmap = outer_entry.getValue();
				Object[] inner_hashmap_keys = inner_hashmap.keySet().toArray();
				Arrays.sort(inner_hashmap_keys);
				for(int i = 0; i < inner_hashmap_keys.length; i ++){
					out.println("<tr><td>" + ((String)inner_hashmap_keys[i]).charAt(0) + "</td><td>" 
					+  ((String)inner_hashmap_keys[i]).charAt(1) + "</td><td>"
					+  ((String)inner_hashmap_keys[i]).charAt(2) + "</td><td>"
					+ inner_hashmap.get(inner_hashmap_keys[i]) + "</td></tr>");
				}
				out.println("</table>");
				out.println("<br>");
			}
		%>

		<button onclick="download();" value="Download">Download Detail Result</button>
		<script type="text/javascript">
 			function backToEntry()
 			{
 				window.location.href = "/CasOT/SessionInvalidationServlet";
 			}
 		</script>
 		<br>
 		<br>
		<input type=button onclick='backToEntry()' value = "Exit the program">
		</center>

	</body>

</html>