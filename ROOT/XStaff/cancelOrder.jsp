<%@include file="../../header.jsp" %>
<%@include file="../../config.jsp" %>
<%@page import="entity.Order"%>
<%@page import="entity.Payment"%>
<%@page import="entity.Config"%>
<%@page import="core.ServiceProduct"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
Object logV = request.getSession().getAttribute("TYPE"); 
if(logV!=null)
{   
        if(!logV.equals("Staff"))
        {
                out.print("<script>window.location.href='../../'</script>");
        } 
}
else
{
        out.print("<script>window.location.href='../../'</script>");
}

%>
<div style="width:100%;height: 40px;background: #E16D6D;">
    <center>
        <a href="<% out.print(home);%>Staff/NewOrder" class='adminHeader'>New Order</a>
        <a href="<% out.print(home);%>Staff/AllOrder" class='adminHeader'>All Order</a>
        <a href="<% out.print(home);%>Staff/CancelOrder" class='adminHeader'>Cancel Order</a>
        <a href="<% out.print(home);%>Staff/Area" class='adminHeader'>Area</a>
    </center>
</div><br>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="vikID('myModal').style.display = 'none';">&times;</span>
        <center>
            <table id='aboutUser' style="width: 50%;"> 
            </table>
            <br>
            <div id="acDiac">

            </div> 
        </center>

    </div>
</div>

<div class="part2" id="adminTable" style="width: 100%;float:left">
    <center>
        <table id="AuthorityTrue" >
            <tr> 
                <th>Payment Id</th>
                <th>Customer ID</th> 
                <th>Product Id</th> 
                <th>Payment Type</th>
                <th>Payment Address</th>
                <th>Transaction Id</th>  
                <th>Success</th>  
            </tr>  
            </tr>    

            <%	  
                   // public String xx(int x){if(x==0){return "No";}else{return "Yes";}}
                    ServiceProduct obj = new ServiceProduct(); 
                    ArrayList<Payment> paymentList = (ArrayList<Payment>)obj.showCancelPayment("");
                    for(Payment py: paymentList){    
                            out.println("<tr>");
                            out.println("<td>"+py.getPayment_id()+ "</td>");  
                            out.println("<td>"+py.getCustomer_id()+ "</td>");  
                            out.println("<td>"+py.getProduct_id()+ "</td>");  
                            out.println("<td>"+py.getPayment_type()+ "</td>");  
                            out.println("<td>"+py.getPayment_address()+ "</td>");  
                            out.println("<td>"+py.getTransaction_id()+ "</td>");  
                            out.println("<td>"+Config.xx(py.getSuccess())+ "</td>");  
                            out.print("</tr>");
                    } 
            %>      
        </table>   
    </center>

</div> 
</body>
</html> 
<script type="text/javascript">
    document.title = "New Order";

    function checkUser(val)
    {
        var xhttp = new XMLHttpRequest();
        var x = "<% out.print(home);%>servlet/Staff?action=checkUserAll&email=" + val;
        xhttp.open("GET", x, true);
        xhttp.send();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                if (this.responseText != "null")
                {
                    var optionList = "<option value=''>Select Deliver</option>";
                    var x = this.responseText.split("@");
                    for (var i = 0; i <= (x.length - 1); i++)
                    {
                        if (x[i] != "")
                        {
                            var n = x[i].split("/");
                            if (n[1] != "undefined") {
                                optionList += "<option value='" + n[1] + "'>" + n[0] + "</option>";
                            }
                        }
                    }
                    vikID('deliverList').innerHTML = optionList;
                } else
                {
                    vikID('delName').value = "Not Found";
                }

            }
        };
    }

</script>