<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-xl-8 py-5 px-md-5">
    <div class="row pt-md-4">
        <div>
            <h3 class="mb-2">${requestScope.SEARCH_MESSAGE}</h3>
        </div>

        <c:if test="${requestScope.LIST_ARTICLE != null}">
            <c:if test="${not empty requestScope.LIST_ARTICLE}">
                <c:if test="${requestScope.LIST_ARTICLE.size() > 0}">
                    <c:forEach var="article" items="${requestScope.LIST_ARTICLE}">
                        <c:url var="article_detail" value="MainController">
                            <c:param name="action" value="View_Article_Details"/>
                            <c:param name="article_ID" value="${article.ID}"/>
                        </c:url>
                        <div class="col-md-12">
                            <div class="blog-entry ftco-animate d-md-flex">
                                <div class="text text-2 pl-md-4">
                                    <h3 class="mb-2"><a href="${article_detail}">${article.title}</a></h3>
                                    <div class="meta-wrap">
                                        <p class="meta">
                                            <span><i class="icon-calendar mr-2"></i>${article.date}</span>
                                            <span><i class="icon-person"></i>${article.authorName}</span>
                                            <span><i class="icon-comment2 mr-2"></i>${article.comments.size()} Comment</span>
                                        </p>
                                    </div>
                                    <p class="mb-4">${article.shortDescription}</p>
                                    <p><a href="${article_detail}" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </c:if>
        </c:if>


    </div>
    <!-- END-->
    <div class="row">
        <div class="col">
            <div class="block-27">
                <ul>
                    <c:if test="${requestScope.NB_PAGE.size() > 1}">
                        <li>
                            <c:url var="pageFrist" value="PaginationController">
                                <c:param name="page" value="1"/>
                            </c:url>
                            <a href="${pageFrist}">&lt;</a>
                        </li>
                        <c:forEach var="page" varStatus="counter" items="${requestScope.NB_PAGE}">

                            <c:url var="pageNumber" value="PaginationController">
                                <c:param name="page" value="${page}"/>
                            </c:url>

                            <li><a href="${pageNumber}">${counter.count}</a></li>

                        </c:forEach>
                        <li>
                            <c:url var="pageLast" value="PaginationController">
                                <c:param name="page" value="${requestScope.NB_PAGE.size()}"/>
                            </c:url>
                            <a href="${pageLast}">&gt;</a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
</div>