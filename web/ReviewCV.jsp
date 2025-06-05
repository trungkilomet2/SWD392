<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV Review System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .cv-container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .cv-item {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .cv-item:last-child {
            border-bottom: none;
        }
        .cv-details {
            flex-grow: 1;
        }
        .cv-details h3 {
            margin: 0;
            color: #333;
        }
        .cv-details p {
            margin: 5px 0;
            color: #666;
        }
        .cv-status {
            font-weight: bold;
            color: #888;
        }
        .cv-status.accepted {
            color: green;
        }
        .cv-status.rejected {
            color: red;
        }
        .buttons a {
            padding: 8px 15px;
            margin-left: 10px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }
        .buttons .accept-btn {
            background-color: #28a745;
        }
        .buttons .reject-btn {
            background-color: #dc3545;
        }
        .buttons .view-cv-btn {
            background-color: #007bff;
        }
        .buttons a.disabled {
            background-color: #ccc;
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <h1>CV Review System</h1>
    <div class="cv-container">
            <div class="cv-item">
                <div class="cv-details">
                    <h3>Tên Người Đăng ký</h3>
                    <p>Position: Vị trí</p>
                    <p class="cv-status">Status: Trạng Thái</p>
                    <p><a href="${cv.pdfLink}" target="_blank" class="view-cv-btn">View CV</a></p>
                </div>
                <div class="buttons">
                    <a href="updateStatus?id=&status=Accepted" class="accept-btn ">Accept</a>
                    <a href="updateStatus?id=&status=Rejected" class="reject-btn ">Reject</a>
                </div>
            </div>
    </div>
</body>
</html>
```