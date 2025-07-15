<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List CV</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ViewProfile.css">
    <!-- Thêm Bootstrap và jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <style>
        /* Đảm bảo các nút có cùng kích thước */
        .form-row .col-auto {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .btn-custom, .btn-primary {
            background-color: #21D375;
            border-color: #21D375;
            color: white;
            width: 150px; /* Đặt cùng kích thước cho các nút */
            height: 45px; /* Chiều cao của nút */
            text-align: center;
            display: inline-block;
            font-size: 16px; /* Kích thước chữ */
            padding: 10px;
            border-radius: 5px; /* Bo góc cho nút */
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        /* Hiệu ứng hover cho các nút */
        .btn-custom:hover, .btn-primary:hover {
            background-color: #17A564;
            border-color: #17A564;
        }

        /* Đặt kích thước và căn chỉnh biểu tượng tải lên */
        .btn-custom i {
            margin-right: 5px;
        }

        .form-control {
            height: 45px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #21D375;
            border-radius: 5px;
        }

        /* Đảm bảo khoảng cách giữa các nút */
        .form-row .col-auto {
            margin-right: 10px;
        }
    </style>

</head>
<body>

<!-- Thanh điều hướng trên cùng -->
<!-- Logo -->
<a href="home">
    <i class="fas fa-home"></i> <!-- Home icon -->
</a>

<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
    <div class="container-fluid">
        <!-- Logo và các mục bên trái -->
        <a class="navbar-brand d-flex align-items-center" href="HomeForSeeker.jsp">
            <img src="https://c.animaapp.com/Qas2dach/img/briefcase-1-1.svg" alt="Logo" width="30" height="30"
                 class="d-inline-block align-text-top">
            <span class="ms-2">G3</span>
        </a>

        <!-- Các mục trong navbar -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home">Trang chủ</a>
                </li>

                <!-- Mục Việc làm -->
                <li class="nav-item">
                    <a class="nav-link" href="findjob"
                            <c:if test="${empty sessionScope.userId}">
                                onclick="redirectToLogin(event)"
                            </c:if>>
                        Việc làm
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<div class="main-content">
    <!-- Sidebar -->
    <div class="col-md-3 sidebar">
        <div class="">
            <div class="">
                <h4 class="accordion-toggle">Quản lý hồ sơ</h4>
                <div class="accordion-content dashbox">
                    <a class="nav-link" href="listcv">
                        <i class="fas fa-file-alt icon"></i> Hồ sơ xin việc
                    </a>
                </div>
                <h4 class="accordion-toggle">Quản lý việc làm</h4>
                <div class="accordion-content">
                    <a class="nav-link" href="listsavejob">
                        <i class="fas fa-bookmark icon"></i> Việc đã lưu
                    </a>
                    <a class="nav-link" href="listappliedjob">
                        <i class="fas fa-file-signature icon"></i> Việc đã ứng tuyển
                    </a>
                    <a class="nav-link" href="listappliedactivejob">
                        <i class="fas fa-bell icon"></i> Thông báo việc làm
                    </a>
                </div>
                <h4 class="accordion-toggle">Câu hỏi phỏng vấn</h4>
                <div class="accordion-content dashbox">
                    <a class="nav-link" href="faquser">
                        <i class="fas fa-file-alt icon"></i> Câu hỏi phỏng vấn
                    </a>
                </div>
                <h4 class="accordion-toggle">Cá nhân</h4>
                <div class="accordion-content">
                    <a class="nav-link" href="viewprofile">
                        <i class="fas fa-user icon"></i> Tùy chỉnh thông tin cá nhân
                    </a>
                    <a class="nav-link" href="changepassword">
                        <i class="fas fa-lock icon"></i> Đổi mật khẩu
                    </a>
                </div>
            </div>
            <a class="nav-link" href="logout">
                <i class="fas fa-sign-out-alt icon"></i> Log out
            </a>
        </div>
    </div>
</div>


<div class="container rw-4">
    <h1 class="text-center md-2">Danh Sách CV</h1>

    <div class="upload-section">
        <form id="cvUploadForm" action="listcv" method="post" enctype="multipart/form-data">
            <div class="form-row align-items-center">
                <!-- Input for CV Name -->
                <div class="col-auto">
                    <input type="text" name="cvName" class="form-control" placeholder="Enter CV Name" required>
                </div>
                <!-- Upload Button -->
                <div class="col-auto">
                    <label for="file-upload" class="btn btn-custom">
                        <i class="fas fa-upload"></i> Chọn CV
                    </label>
                    <input id="file-upload" type="file" name="file" accept="application/pdf" style="display: none;" required>
                </div>
                <!-- Submit Button -->
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Tải CV lên</button>
                </div>
            </div>
            <script>
                function validateAndSubmit() {
                    var cvName = document.querySelector('input[name="cvName"]').value;
                    var fileInput = document.getElementById('file-upload');

                    if (cvName.trim() === '') {
                        alert("Please enter a CV name.");
                    } else if (fileInput.files.length === 0) {
                        alert("Please select a PDF file to upload.");
                    } else {
                        document.getElementById('cvUploadForm').submit();
                    }
                }

                document.getElementById('file-upload').addEventListener('click', function() {
                    this.required = true;
                });
            </script>
        </form>
    </div>

    <div class="row">
        <!-- Duyệt qua danh sách CV và hiển thị -->
        <c:forEach var="cv" items="${ListCV}">
            <div class="col-md-6 d-flex">
                <div class="card w-100">
                    <div class="card-body d-flex">
                        <div class="iframe-container mr-3">
                            <!-- Hiển thị CV thu nhỏ -->
                            <iframe src="viewPdf?cvId=${cv.id}" type="application/pdf"></iframe>

                        </div>
                        <div class="flex-grow-1">
                            <h5 class="card-title">Name: ${cv.cvStatus}</h5>
                            <!-- cty , tg nop -->
                            <div class="card-icons">
                                <a href="viewPdf?cvId=${cv.id}" target="_blank" class="text-info">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="downloadPdf?cvId=${cv.id}" class="text-success">
                                    <i class="fas fa-download"></i>
                                </a>

                                <a href="#" class="text-warning" data-toggle="modal" data-target="#editCvModal" onclick="loadCvData(${cv.id}, '${cv.cvStatus}')">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="deleteCvServlet?cvId=${cv.id}" class="text-danger" onclick="return confirmDelete();">
                                    <i class="fas fa-trash"></i>
                                </a>

                                <script>
                                    function confirmDelete() {
                                        return confirm("Bạn có chắc chắn muốn xóa CV này không?");
                                    }
                                </script>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="editCvModal" tabindex="-1" role="dialog" aria-labelledby="editCvModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCvModalLabel">Chỉnh sửa CV</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <!-- Thêm trường input để chỉnh sửa tên CV -->
                <div class="modal-body">
                    <form id="editCvForm" action="editCvServlet" method="post">
                        <!-- Thêm hidden input để gửi ID của CV -->
                        <input type="hidden" id="cvId" name="cvId" value="${cv.id}">
                        <!-- Hiển thị tên CV hiện tại trong trường input -->
                        <div class="form-group">
                            <label for="cvName">Tên CV:</label>
                            <input type="text" class="form-control" id="cvName" name="cvName" value="${cv.cvStatus}" required>
                        </div>
                    </form>
                </div>

                <script>
                    function loadCvData(cvId, cvStatus) {
                        // Đặt giá trị cvId vào input ẩn
                        document.getElementById('cvId').value = cvId;

                        // Đặt giá trị tên CV vào trường input
                        document.getElementById('cvName').value = cvStatus;
                    }
                </script>


                <div class="modal-footer">
                    <!-- Nút lưu thay đổi -->
                    <button type="submit" class="btn btn-primary" form="editCvForm">Lưu thay đổi</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

</div>



</body>
</html>
