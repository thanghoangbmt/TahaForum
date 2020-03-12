<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary" class="js-fullheight">
    <c:if test="${sessionScope.USER != null}">
        <c:if test="${not empty sessionScope.USER.name}">
            <h1>Welcome ${sessionScope.USER.name}!</h1>
        </c:if>
    </c:if>
    <nav id="colorlib-main-menu" role="navigation">
        <ul>
            <li>
                <a href="AdminArticleIndexController">Articles Management</a>
            </li>

            <c:if test="${sessionScope.USER == null}">
                <li>
                    <a href="login.jsp">Login/Register</a>
                </li>
            </c:if>

            <c:if test="${sessionScope.USER != null}">
                <c:url var="Logout" value="MainController">
                    <c:param name="action" value="Logout"></c:param>
                </c:url>
                <li>
                    <a href="${Logout}">Logout</a>
                </li>
            </c:if>
        </ul>
    </nav>

    <div class="colorlib-footer">
        <h1 id="colorlib-logo" class="mb-4"><a href="AdminArticleIndexController" style="background-image: url(images/bg_1.jpg);">TaHa <span>Forum</span></a></h1>
    </div>
</aside>