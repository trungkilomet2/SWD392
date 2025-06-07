<%@page import="Model.Job"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách công việc</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --success-color: #1cc88a;
            --light-gray: #f8f9fc;
        }

        body {
            background-color: var(--light-gray);
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        .card {
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }

        .card-header {
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
            padding: 1rem 1.35rem;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead th {
            vertical-align: middle;
            border-bottom: 2px solid #e3e6f0;
            color: #4e73df;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.65rem;
            letter-spacing: 0.1em;
        }

        .table td, .table th {
            padding: 0.75rem;
            vertical-align: middle;
            border-top: 1px solid #e3e6f0;
        }

        .status-badge {
            display: inline-block;
            padding: 0.35em 0.65em;
            font-size: 0.75em;
            font-weight: 700;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: 0.25rem;
        }

        .status-active {
            color: #fff;
            background-color: var(--success-color);
        }

        .status-inactive {
            color: #fff;
            background-color: #e74a3b;
        }

        .job-type {
            display: inline-block;
            padding: 0.25em 0.5em;
            font-size: 0.75em;
            font-weight: 600;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: 0.25rem;
            background-color: #f8f9fc;
            color: #3a3b45;
            border: 1px solid #d1d3e2;
        }

        .pagination .page-item.active .page-link {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .pagination .page-link {
            color: var(--primary-color);
        }

        .action-btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.75rem;
            border-radius: 0.2rem;
        }

        .logo-placeholder {
            width: 40px;
            height: 40px;
            background-color: #e3e6f0;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #b7b9cc;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container-fluid py-4">
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">Danh sách công việc</h6>
            <div>
                <a href="#" class="btn btn-sm btn-primary">
                    <i class="fas fa-plus fa-sm"></i> Thêm mới
                </a>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Logo</th>
                        <th>Tiêu đề</th>
                        <th>Loại công việc</th>
                        <th>Công ty</th>
                        <th>Khu vực</th>
<%--                        <th>Người đăng</th>--%>
<%--                        <th>Ngành nghề</th>--%>
                        <th>Ngày đăng</th>
                        <th>Thời hạn</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Job> jobs = (List<Job>) request.getAttribute("jobs");
                        int itemsPerPage = 5;
                        int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
                        int startIndex = (currentPage - 1) * itemsPerPage;
                        int endIndex = Math.min(startIndex + itemsPerPage, jobs != null ? jobs.size() : 0);

                        if (jobs != null && !jobs.isEmpty()) {
                            for (int i = startIndex; i < endIndex; i++) {
                                Job job = jobs.get(i);
                    %>
                    <tr>
                        <td class="text-center">
                            <div class="logo-placeholder">
                                <%= job.getCompanyName().substring(0, 1) %>
                            </div>
                        </td>
                        <td><%= job.getJobTitle() %></td>
                        <td>
                            <span class="job-type"><%= job.getJobType() %></span>
                        </td>
                        <td><%= job.getCompanyName() %></td>
                        <td><%= job.getLocation() %></td>
<%--                        <td><%= job.getPosterName() != null ? job.getPosterName() : "N/A" %></td>--%>
<%--                        <td><%= job.getIndustry() != null ? job.getIndustry() : "N/A" %></td>--%>
                        <td><%= job.getCreateDate() %></td>
                        <td><%= job.getEndDate() %></td>
                        <td class="text-center">
                            <form action="JobController" method="get" class="d-inline">
                                <input type="hidden" name="action" value="changeStatus">
                                <input type="hidden" name="jobId" value="<%= job.getJobId() %>">
                                <input type="hidden" name="status" value="<%= job.getStatus() %>">
                                <button type="submit" class="btn p-0 border-0 bg-transparent">
                                            <span class="status-badge <%= job.getStatus() == 1 ? "status-active" : "status-inactive" %>">
                                                <%= job.getStatus() == 1 ? "Hoạt động" : "Không hoạt động" %>
                                            </span>
                                </button>
                            </form>
                        </td>
                        <td class="text-center">
                            <a href="JobController?action=edit&jobId=<%= job.getJobId() %>"
                               class="btn btn-sm btn-primary action-btn" title="Sửa">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="#" class="btn btn-sm btn-danger action-btn" title="Xóa">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="11" class="text-center py-4">Không có công việc nào được tìm thấy</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>

                <!-- Pagination -->
                <%
                    if (jobs != null && jobs.size() > itemsPerPage) {
                        int totalPages = (int) Math.ceil((double) jobs.size() / itemsPerPage);
                %>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center mt-4">
                        <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="?page=<%= currentPage - 1 %>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                        <%
                            for (int i = 1; i <= totalPages; i++) {
                        %>
                        <li class="page-item <%= i == currentPage ? "active" : "" %>">
                            <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                        </li>
                        <%
                            }
                        %>

                        <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                            <a class="page-link" href="?page=<%= currentPage + 1 %>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>