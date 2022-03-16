<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
    <head>
        <title>luv2code Company Home Page</title>
    </head>
    <body>
        <h2>luv2code Company Home Page</h2>
        <p>Welcome to the luv2code Company Home Page</p>

        <hr />

        <p>User: <security:authentication property="principal.username" /> </p>
        <p>Role(s): <security:authentication property="principal.authorities" /> </p>

        <security:authorize access="hasRole('MANAGER')">
            <p>
                <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a> (Only for Managers peeps)
            </p>
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
            <p>
                <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a> (Only for Admins peeps)
            </p>
        </security:authorize>

        <hr />

        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout" />
        </form:form>
    </body>
</html>