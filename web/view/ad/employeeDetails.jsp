<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<!DOCTYPE html>
<html lang="vi">
<t:dashboard>

    <div class="container rounded bg-white mt-5 mb-5" style="margin-right: 40px; padding: 30px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <div class="row">
            <div class="col-md-3 border-right text-center">
                <div class="profile-header">
                    <img class="rounded-circle" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg" style="width: 150px; height: 150px; border: 2px solid #007bff;">
                    <h4 class="mt-3">${requestScope.data.name_emp}</h4>
                    <p>${requestScope.data.email}</p>
                </div>
            </div>
            <form action="employeedetails" method="post" class="col-md-9">
                <div class="p-3 py-5">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4>Employee Details</h4>
                    </div>
                    <input type="hidden" value="${param.emp_id}" name="emp_id"/>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="labels">Name</label>
                            <input type="text" class="form-control" placeholder="First Name" value="${requestScope.data.name_emp}" name="name">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Mobile Number</label>
                            <input type="text" class="form-control" placeholder="Enter phone number" value="${requestScope.data.phone}" name="phone">
                        </div>
                        <div class="col-md-12 mt-3">
                            <label class="labels">Email</label>
                            <input type="text" class="form-control" placeholder="Enter email" value="${requestScope.data.email}" name="email">
                        </div>
                        <div class="col-md-12 mt-3">
                            <label class="labels">Role</label>
                            <input type="text" class="form-control" placeholder="Role" value="${requestScope.data.role.role_name}" readonly>
                        </div>
                        <div class="col-md-12 mt-3">
                            <label class="labels">Status</label>
                            <select class="form-control" name="status">
                                <option value="true" ${requestScope.data.status == 'true' ? 'selected' : ''}>Kích Hoạt</option>
                                <option value="false" ${requestScope.data.status == 'false' ? 'selected' : ''}>Chưa kích hoạt</option>
                            </select>
                        </div>
                    </div>
                    <div class="mt-5 text-center">
                        <button class="btn btn-primary profile-button" type="submit" style="border-radius: 30px; padding: 10px 20px;">Save Profile</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</t:dashboard>
</html>
