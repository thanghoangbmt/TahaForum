<div class="col-xl-4 sidebar ftco-animate bg-light pt-5">
    <div class="sidebar-box pt-md-4">
        <form action="MainController" class="search-form">
            <div class="form-group">
                <span class="icon icon-search"></span>
                <input type="text" class="form-control" placeholder="Type a keyword" name="txtSearch" value="${sessionScope.pattern}">
            </div>

            <div class="form-group mt-3">
                <label for="article-status-option">Choose status:</label>
                <select id="article-status-option" name="cbStatusID" form-control>
                    <option value="All">All Status</option>
                    <option value="New">New</option>
                    <option value="Actived">Actived</option>
                    <option value="Deleted">Deleted</option>
                </select>
            </div>

            <div class="form-group" style="text-align: center">
                <button type="submit" class="btn btn-primary" style="margin-top: 1rem" name="action" value="Admin_Article_Search">Search</button>
            </div>
        </form>
    </div>
</div>