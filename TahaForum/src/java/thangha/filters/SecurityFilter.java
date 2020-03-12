/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thangha.filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import thangha.controllers.MainController;
import thangha.dtos.AccountDTO;

/**
 *
 * @author Admin
 */
public class SecurityFilter implements Filter {

    private static final boolean debug = true;

    private final static Logger LOGGER = Logger.getLogger(MainController.class.getName());

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    private final List<String> user;
    private final List<String> admin;
    private final List<String> clone;

    public SecurityFilter() {
        user = new ArrayList<>();
        user.add("");
        user.add("article_details.jsp");
        user.add("create_post.jsp");
        user.add("index.jsp");
        user.add("login.jsp");
        user.add("IndexController");
        user.add("LoginController");
        user.add("LogoutController");
        user.add("MainController");
        user.add("PaginationController");
        user.add("PostCommentController");
        user.add("PostNewArticleController");
        user.add("SearchController");
        user.add("ViewArticleDetailsController");

        admin = new ArrayList<>();
        admin.add("admin.jsp");
        admin.add("admin_article_details.jsp");
        admin.add("MainController");
        admin.add("AdminAccountIndexController");
        admin.add("AdminApproveArticleController");
        admin.add("AdminArticleIndexController");
        admin.add("AdminArticlePaginationController");
        admin.add("AdminDeleteArticleController");
        admin.add("AdminSearchArticleController");
        admin.add("AdminViewArticleDetailsController");

        clone = new ArrayList<>();
        clone.add("");
        clone.add("article_details.jsp");
        clone.add("index.jsp");
        clone.add("register.jsp");
        clone.add("verification.jsp");
        clone.add("MainController");
        clone.add("PaginationController");
        clone.add("IndexController");
        clone.add("SearchController");
        clone.add("CreateVerificationCodeController");

    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("SecurityFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("SecurityFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            String uri = req.getRequestURI();
            LOGGER.info("Uri: " + uri);
            if ((uri.contains(".js") || uri.contains(".jpg") || uri.contains(".png")
                    || uri.contains(".gif") || uri.contains("jpeg") || uri.contains(".css")
                    || uri.contains(".woff") || uri.contains(".ttf")) && !uri.contains(".jsp")) {
                chain.doFilter(request, response);
            } else {
                if (uri.contains("login.jsp") || uri.contains("LoginController")) {
                    chain.doFilter(request, response);
                    return;
                }
                int index = uri.lastIndexOf("/");
                String resource = uri.substring(index + 1);
                HttpSession session = req.getSession(false);
                log("AuthenFilter " + resource);
                if (session == null || session.getAttribute("USER") == null) {
                    if (clone.contains(resource)) {
                        String action = req.getParameter("action");
                        if (action == null) {
                            chain.doFilter(request, response);
                        }
                        if (action != null && action.equals("Post_Comment")) {
                            res.sendRedirect("login.jsp");
                        } else if (action != null && (action.equals("Search")
                                || action.equals("View_Article_Details") || action.equals("Login") 
                                || action.equals("Register") || action.equals("FinishRegister"))) {
                            chain.doFilter(request, response);
                        }
                    } else {
                        res.sendRedirect("login.jsp");
                    }
                } else {
                    AccountDTO accountDTO = (AccountDTO) session.getAttribute("USER");
                    String role = (String) accountDTO.getRole();
                    if (role.equals("Admin") && admin.contains(resource)) {
                        chain.doFilter(request, response);
                    } else if (!role.equals("Admin") && user.contains(resource)) {
                        chain.doFilter(request, response);
                    } else {
                        res.sendRedirect("login.jsp");
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.error("Error at SecurityFilter: " + e.getMessage());
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("SecurityFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("SecurityFilter()");
        }
        StringBuffer sb = new StringBuffer("SecurityFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
