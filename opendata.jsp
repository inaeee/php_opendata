<body>
<center>
<h3>OPENDATA</h3>
<table>
<tr bgcolor='lightblue'>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<script type="text/javascipte" language="javascript">
function checkAll(){
	var obj=document.frm;
	for(var i=0;i<obj.checkbox.length;i++){
		obj.checkbox[i].checked=obj.chkAll.checked;
	}
}
</script>

<form name="frm" action="opendata.jsp" method="post">
<input type="checkbox" name="chkAll" onClick="javascript:checkAll();"/>ALL
<input type="checkbox" name="checkbox[]" id="checkbox" />udate
<input type="checkbox" name="checkbox[]" id="checkbox" />route
<input type="checkbox" name="checkbox[]" id="checkbox" />stid
<input type="checkbox" name="checkbox[]" id="checkbox" />stname
<input type="checkbox" name="checkbox[]" id="checkbox" />ptnum
<input type="checkbox" name="checkbox[]" id="checkbox" />pdnum
<input type="checkbox" name="checkbox[]" id="checkbox" />regd<br />
<input type="text" name="text" id="text" />
<input type="button" value="SEARCH" onClick="document.frm.submit();"/>
</form>

<%
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
String url="jdbc:mysql://localhost:3306/hwangia1786";
String id="hwangia1786";
String pww="mshwangia1786M";

try{
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,id,pww);
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select * from subway");

	out.println("<pre>\n");
	out.println("<b>udate\t	route\t	stid\t	stname\t	ptnum\t	pdnum\t	regd</b>");
	out.println("<tr bgcolor='lightblue'>");
	String fdv;
	int i;

	while(rs.next()){
	out.println("<tr bgcolor='honeydew'>");
		for(i=1;i<7;i++){
			fdv=rs.getString(i);
			out.print("<td>"+fdv+"\t</td>");
		}
		fdv=rs.getString(i);
		out.print("<td>"+fdv+"</td>");
		out.println("\n</tr>");
	}
	out.println("</pre>\n");
} catch(SQLException e){
	out.println(e.getMessage());
} finally {
	if(rs!=null)try{rs.close();}catch(SQLException ex){}
	if(stmt !=null)try{stmt.close();}catch(SQLException ex){}
	if(conn!=null)try{conn.close();}catch(SQLException ex){}
}

%>
</table>
</center>
</body>
