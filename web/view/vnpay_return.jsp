<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="modal.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Payment Result</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                margin-top: 50px;
            }
            .header h3 {
                font-weight: bold;
            }
            .form-group label {
                font-weight: bold;
            }
            .btn-home {
                margin-top: 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
            }
            .btn-home:hover {
                background-color: #0056b3;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">Payment Result</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label>Transaction ID:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>
                <div class="form-group">
                    <label>Amount:</label>
                    <label><%=request.getParameter("vnp_Amount").replaceAll("00$", "")%></label>
                </div>
                <div class="form-group">
                    <label>Order Description:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div>
                <div class="form-group">
                    <label>Response Code:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div>
                <div class="form-group">
                    <label>Transaction Number:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div>
                <div class="form-group">
                    <label>Bank Code:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div>
                <div class="form-group">
                    <label>Payment Date:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div>
                <div class="form-group">
                    <label>Transaction Status:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Success");
                        %>
                        <script>
                            $.ajax({
                                url: '<%=request.getContextPath()%>/payServlet',
                                type: 'GET',
                                success: function (response) {
                                    // Handle the response from the servlet if needed
                                    console.log('Servlet response:', response);
                                },
                                error: function (xhr, status, error) {
                                    console.error('AJAX error:', status, error);
                                }
                            });
                        </script>
                        <%

                                } else {
                                    out.print("Failed");
                                }
                            } else {
                                out.print("Invalid signature");
                            }
                        %>
                    </label>
                </div>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/Home" class="btn-home">Return to Home</a>
            </div>
            <p>&nbsp;</p>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>
    </body>
</html>

