package pl.coderslab.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "UserFilter", urlPatterns = {"/user/*","/tweet/*", "/comment/*", "/message/*","/search"})
public class UserFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session =  request.getSession();
        if(session.getAttribute("loggedUser") != null){
            chain.doFilter(req, resp);
        } else {
            response.sendRedirect("/login");

        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
