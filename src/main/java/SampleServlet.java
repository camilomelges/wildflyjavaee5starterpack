import javax.faces.context.FacesContext;
import javax.servlet.Servlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;

public class SampleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println("ServletConfig: " + this.getServletConfig());
        System.out.println("Server Info: " + req.getSession().getServletContext().getServerInfo());
        System.out.println("Faces version: " + FacesContext.class.getPackage().getImplementationVersion());
        System.out.println("Pages version: " + JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion());
        System.out.println("Servlet Info: " + req.getSession().getServletContext().getMajorVersion() + "." + req.getSession().getServletContext().getMinorVersion());
    }
}
