<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Add New Job</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
  <link rel="stylesheet" href="https://ojt.fpt.edu.vn/lib-download/css/bootstrap.min.css"/>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: #ddd;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header button, .profile-btn {
      padding: 5px 15px;
      background-color: #555;
      color: #fff;
      border: none;
      margin: 0 10px;
      cursor: pointer;
    }
    header input {
      width: 300px;
      padding: 7px;
      border: 1px solid #ccc;
    }
    .container {
      padding: 20px;
      max-width: 700px;
      margin: 0 auto;
    }
    .form-group label {
      font-weight: bold;
    }
    .form-group input,
    .form-group textarea,
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .form-group textarea {
      height: 100px;
    }
    .btn-submit {
      background-color: #0265B1;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Job Search Portal</a>
    <div class="collapse navbar-collapse">
      <form class="form-inline my-2 my-lg-0" style="margin-left: 78vw">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <img src="https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg"
                   alt="Profile" width="40" height="40" class="rounded-circle">
            </a>
            <div class="dropdown-menu dropdown-menu-right" style="width:150px"
                 aria-labelledby="navbarDropdownMenuLink">
              <a class="dropdown-item" href="#">Profile</a>
              <a class="dropdown-item" href="#">Log out</a>
            </div>
          </li>
        </ul>
      </form>
    </div>
  </nav>
</header>

<div class="container">
  <h2 class="py-3">Add New Job</h2>
  <form method="post" action="${pageContext.request.contextPath}/add-job">

    <div class="form-group">
      <label for="jobTitle">Job Title</label>
      <input type="text" id="jobTitle" name="jobTitle" required>
    </div>

    <div class="form-group">
      <label for="categoryId">Category</label>
      <select id="categoryId" name="categoryId" required>
        <option value="">-- Select Category --</option>
        <option value="1">IT - Software</option>
        <option value="2">Marketing</option>
        <option value="3">Finance</option>
      </select>
    </div>

    <div class="form-group">
      <label for="location">Location</label>
      <input type="text" id="location" name="location" required>
    </div>

    <div class="form-group">
      <label for="position">Job Position</label>
      <input type="text" id="position" name="position" required>
    </div>

    <div class="form-group">
      <label for="experience">Experience Required</label>
      <input type="text" id="experience" name="experience" required>
    </div>

    <div class="form-group">
      <label for="skills">Skills Required</label>
      <input type="text" id="skills" name="skills" required>
    </div>

    <div class="form-group">
      <label for="gender">Gender</label>
      <select id="gender" name="gender" required>
        <option value="">-- Select Gender --</option>
        <option value="Male">Male</option>
        <option value="Female">Female</option>
      </select>
    </div>

    <div class="form-group">
      <label for="profession">Profession</label>
      <input type="text" id="profession" name="profession" required>
    </div>

    <div class="form-group">
      <label for="jobType">Job Type</label>
      <select id="jobType" name="jobType" required>
        <option value="Contract">Contract</option>
        <option value="Part-Time">Part-Time</option>
        <option value="Full-Time">Full-Time</option>
      </select>
    </div>

    <div class="form-group">
      <label for="numberOfSeeker">Number of Positions</label>
      <input type="number" id="numberOfSeeker" name="numberOfSeeker" required>
    </div>

    <div class="form-group">
      <label for="salary">Salary</label>
      <input type="text" id="salary" name="salary" required>
    </div>

    <div class="form-group">
      <label for="jobDescription">Job Description</label>
      <textarea id="jobDescription" name="jobDescription" required></textarea>
    </div>

    <div class="form-group">
      <label for="requirements">Job Requirements</label>
      <textarea id="requirements" name="requirements" required></textarea>
    </div>

    <div class="form-group">
      <label for="workingTime">Working Time</label>
      <input type="text" id="workingTime" name="workingTime" required>
    </div>

    <div class="form-group">
      <label for="endDate">Application Deadline</label>
      <input type="date" id="endDate" name="endDate" required>
    </div>

    <input type="hidden" name="createDate" value="<%= today %>">
    <input type="hidden" name="status" value="1">

    <button type="submit" class="btn-submit">Submit</button>
  </form>
</div>
</body>
</html>
