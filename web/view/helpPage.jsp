<%-- 
    Document   : helpPage
    Created on : Jul 11, 2024, 9:44:49 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help Center</title>
    <link rel="stylesheet" href="styles.css">
    <link href="${pageContext.request.contextPath}/assets_help/newcss.css" rel="stylesheet">
</head>


<body>
    
    <jsp:include page="homeTag.jsp"></jsp:include>
    
    <div class="container">
        
        <h1>GET HELP</h1>
        <div class="search-bar">
            <input type="text" placeholder="What can we help you with?">
        </div>
        <div class="quick-assists">
            <h2>Quick assists</h2>
            <p>Answers to our most frequently asked questions are just one click away.</p>
            <div class="faq-section">
                <div class="faq-category">
                    <h3>Dispatch & delivery</h3>
                    <ul>
                        <li><a href="https://www.nike.com/vn/help/a/free-shipping"target="_blank">How do I get free delivery on Nike orders?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/shipping-delivery-gs"target="_blank">What are Nike's delivery options?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/international-shipping"target="_blank">Can my Nike order be dispatched internationally?</a></li>
                    </ul>
                </div>
                <div class="faq-category">
                    <h3>Returns</h3>
                    <ul>
                        <li><a href="https://www.nike.com/vn/help/a/how-to-return-gs"target="_blank">How do I return my Nike order?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/returns-policy-gs"target="_blank">What is Nike's returns policy?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/refund-info"target="_blank">Where is my refund?</a></li>
                    </ul>
                </div>
                <div class="faq-category">
                    <h3>Orders</h3>
                    <ul>
                        <li><a href="https://www.nike.com/vn/help/a/order-tracking-gs"target="_blank">Where is my Nike order?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/change-cancel-order-gs"target="_blank">Can I cancel or change my Nike order?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/payment-options-gs"target="_blank">What are Nike's payment options?</a></li>
                    </ul>
                </div>
                <div class="faq-category">
                    <h3>Product info</h3>
                    <ul>
                        <li><a href="https://www.nike.com/vn/help/a/launch-tips-gs"target="_blank">How do I get Nike’s newest sneaker releases?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/size-charts-gs"target="_blank">How do I find the right size and fit?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/personal-id-guidelines"target="_blank">What is Nike By You's personalization policy?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/shoe-warranty-gs"target="_blank">Do Nike shoes have a warranty?</a></li>
                    </ul>
                </div>
                <div class="faq-category">
                    <h3>Nike Membership</h3>
                    <ul>
                        <li><a href="https://www.nike.com/vn/help/a/member-benefits-gs"target="_blank">What is Nike Membership?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/create-nike-profile"target="_blank">How do I become a Nike Member?</a></li>
                        <li><a href="https://www.nike.com/vn/help/a/ntc-nrc"target="_blank">How do I get the most out of NRC and NTC?</a></li>
                    </ul>
                </div>
                <div class="faq-category">
                    <h3>Corporate</h3>
                    <ul>
                        <li><a href="https://www.nike.com/vn/help/a/nike-corporate-details"target="_blank">Where can I get more info about Nike, Inc.?</a></li>

                    </ul>
                </div>
            </div>
        </div>
        <h1>Contact Us</h1>
        <div class="contact-section">
            <div class="contact-item">
                <img src="chat-icon.png" alt="Chat Icon">
                <h2>Chat with us</h2>
                <p>5:00 - 23:00</p>
                <p>7 days a week</p>
            </div>
            <div class="contact-item">
                <img src="call-icon.png" alt="Call Icon">
                <h2>Call us</h2>
                <p>12280903 (Viettel)</p>
                <p>12032487 (VTI)</p>
                <p>5:00 - 23:00</p>
                <p>7 days a week</p>
            </div>
            <div class="contact-item">
                <img src="store-icon.png" alt="Store Icon">
                <h2>Find a Store</h2>
            </div>
        </div>
    </div>
    
            <jsp:include page="FooterTag.jsp"></jsp:include>
</body>
</html>

