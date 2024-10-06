<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cảm ơn bạn đã mua hàng</title>
        <style>
            /* Reset some basic styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f4f4f4;
                color: #333;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            /* Container holding the content */
            .thank-you-container {
                background-color: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: 100px auto;
                text-align: center;
            }

            h1 {
                font-size: 36px;
                color: #4CAF50;
                margin-bottom: 20px;
            }

            p {
                font-size: 18px;
                color: #555;
                margin-bottom: 20px;
                line-height: 1.6;
            }

            .btn-home {
                display: inline-block;
                padding: 12px 30px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                font-size: 18px;
                transition: background-color 0.3s ease, transform 0.3s;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .btn-home:hover {
                background-color: #45a049;
                transform: translateY(-2px);
            }

            .footer {
                margin-top: 40px;
                font-size: 14px;
                color: #999;
            }

            .page-container {
                flex-grow: 1;
            }

            

            
        </style>
    </head>
    <body>
        <jsp:include page="/Demo_Template/BasePage/Header.jsp"/>

        <div class="page-container">
            <div class="thank-you-container">
                <h1>Cảm ơn bạn!</h1>
                <p>Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi. Chúng tôi đã gửi cho bạn 1 email để xác nhận và đánh giá, vui lòng kiểm tra mục thư của mình.</p>

                <a href="${pageContext.request.contextPath}/homepage" class="btn-home">Quay về trang chủ</a>
                <div class="footer">
                    <p>&copy; 2024 Cửa hàng KEISHA. Tất cả các quyền được bảo lưu.</p>
                </div>
            </div>
        </div>

        <jsp:include page="/Demo_Template/BasePage/Footer.jsp" />
    </body>
</html>
