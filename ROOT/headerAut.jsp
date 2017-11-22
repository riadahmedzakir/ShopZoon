<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="config.jsp" %>
<%@page import="entity.Config"%>
<%@page import="core.ServiceJoin"%>
<% 
if (request.getSession().getAttribute("ID").toString() == "") 
{
    out.print("<script>window.location.href='"+home+"/log;</script>");
}
else if (request.getSession().getAttribute("ID") != null) {
%> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title></title>
    <link rel='stylesheet' type='text/css' href='<% out.print(home); %>/CSS/header.css'>
    <link rel='stylesheet' type='text/css' href='<% out.print(home); %>/CSS/allCatagoty.css'>
    <link rel='stylesheet' type='text/css' href='<% out.print(home); %>/CSS/style.css'>
    <script src="<% out.print(home); %>JS/valid.js"></script> 
</head>
<body id="bodyid">
    <div class='popupNoti' id='popupNoti'>
        <font style='float:right;padding:5px 10px 10px 10px;cursor: pointer;' onclick='popupNotiClose("popupNoti")'>&#10008;</font> 
        <div style='padding: 3px 10px 10px 10px;'>
            <center><h3 id='popupNotiText'></h3></center>
        </div> 
    </div> 
    <div class='popupNoti' id='popupNotiF'>
        <font style='float:right;padding:5px 10px 10px 10px;cursor: pointer;' onclick='popupNotiCloseF("popupNotiF")'>&#10008;</font> 
        <div style='padding: 3px 10px 10px 10px;'>
            <center><h3 id='popupNotiTextF'></h3></center>
        </div> 
    </div> 
    <div class='header'> 
        <input type='image' src='<% out.print(home); %>img/logo.png' width='60' height='60' style="border-radius: 52px;padding:5px" onclick="window.location.href = '<% out.print(home); %>'">
        <input type='text' id="srcText" value='<c:out value="${param.q}" />' style='margin:20px 200px;height:30px;width: 400px;float: left;' placeholder=" Search" oninput="searching(this.value)">
        <input type='submit' style='margin:20px -200px;height:36px;width:100px;float:left;background:#3C3C41;border:none;color:white;font-size:18px' value='Search' list='sValue' onclick="goSearch(vikID('srcText').value)">
        <script type="text/javascript"> 
        function goSearch(val)
        {
            window.location.href='http://localhost:8080/search?q='+val;
        }
        </script>
        <div class='headerItems'> 
            <ul>  
                <li> 
                    <% 

                       ServiceJoin obj=new ServiceJoin(); 
                       out.print("<a href='"+home+"cartpanding' class='headerUlLiA'> "+
                                                    "<div class='logRegDropDown'>("+obj.unComplicateOrder(request.getSession().getAttribute("ID").toString())+") Items</a> "+
                                                            "<div class='logRegDropDown-content'> "+
                                                                    "<a href=' "+home+"cart'><p class='logRegDropDownP'>Cart</p></a> "+
                                                                    "<a href=' "+home+"cartpanding'><p class='logRegDropDownP'>Cart Panding</p></a> "+ 
                                                            "</div> "+
                                               "</div>");
                    %>
                </li>
                <li>
                    <% 
                    if(request.getSession().getAttribute("TYPE").equals("Admin"))
                    {
                            out.print("<a href='"+home+"Admin/ActiveAcc' class='headerUlLiA'> "+
                                                    "<div class='logRegDropDown'>Admin Panel</a> "+
                                                            "<div class='logRegDropDown-content'> "+
                                                                    "<a href=' "+home+"ProductUpload'><p class='logRegDropDownP'>Upload Product</p></a> "+
                                                                    "<a href=' "+home+"Admin/Employee'><p class='logRegDropDownP'>Employee</p></a> "+
                                                                    "<a href=' "+home+"Admin/ActiveAcc'><p class='logRegDropDownP'>Active Account</p></a> "+
                                                                    "<a href=' "+home+"Admin/AddCatagory'><p class='logRegDropDownP'>Add Catagory</p></a> "+
                                                            "</div> "+
                                               "</div>");
                    }  
                    else if(request.getSession().getAttribute("TYPE").equals("Staff"))
                    {
                            out.print("<a href='"+home+"Staff/NewOrder' class='headerUlLiA'> "+
                                                    "<div class='logRegDropDown'>Staff Panel</a> "+
                                                            "<div class='logRegDropDown-content'> "+
                                                                "<a href=' "+home+"ProductUpload'><p class='logRegDropDownP'>Upload Product</p></a> "+
                                                                    "<a href=' "+home+"Staff/NewOrder'><p class='logRegDropDownP'>New Order</p></a> "+
                                                                    "<a href=' "+home+"Staff/AllOrder'><p class='logRegDropDownP'>All Order</p></a> "+
                                                                    "<a href=' "+home+"Staff/Area'><p class='logRegDropDownP'>Area</p></a> "+
                                                            "</div> "+
                                               "</div>");
                    }  
                    else if(request.getSession().getAttribute("TYPE").equals("Deliver"))
                    {
                            out.print("<a href='"+home+"Staff/NewOrder' class='headerUlLiA'> "+
                                                    "<div class='logRegDropDown'>Deliver Panel</a> "+
                                                            "<div class='logRegDropDown-content'> "+
                                                                    "<a href=' "+home+"Deliver/NewOrder'><p class='logRegDropDownP'>New Order</p></a> "+
                                                                    "<a href=' "+home+"Deliver/AllOrder'><p class='logRegDropDownP'>All Order</p></a> "+
                                                            "</div> "+
                                               "</div>");
                    }   
                    %>

                </li>
                <li>
                    <a href='<% out.print(home+"u/"+request.getSession().getAttribute("USERNAME").toString());%>' class='headerUlLiA'>
                        <div class='logRegDropDown'><% out.print(request.getSession().getAttribute("FNAME").toString());%> <img src='<% out.print(Config.isImg("user/user"+request.getSession().getAttribute("ID").toString()+".png"));%>' height="40px" width="40px" style="border-radius:50px" align='top'></a>
                            <div class='logRegDropDown-content' > 
                                <a href='<% out.print(home); %>/logout.jsp'><p class='logRegDropDownP'> Log Out</p></a>
                            </div>
                        </div> 
                </li>
            </ul>
        </div>
    </div><br><br><br><br>  
    <% 
    }
   else
   {
       session.invalidate();
       response.sendRedirect("log.jsp");
       return;  
   }
	 
    %>