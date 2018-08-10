package test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/getCity")
public class getCityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//post有效

//        str = new String(str.getBytes("iso-8859-1"),"utf-8");//get方式
//        response.setContentType("text/html");
        System.out.println(request.getParameter("sendType"));
//        System.out.println(request.getParameter("countryName"));
        String dt = request.getParameter("dt");
        String str = request.getParameter("countryName");

//        String str = new String(request.getParameter("countryName").getBytes("iso-8859-1"),"utf-8");



        StringBuffer sb = new StringBuffer("");
        if("xml".equals(dt)){
            sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?><root>");
            response.setContentType("text/xml;charset=utf-8");
            if("中国".equals(str)){
                sb.append("<city>北京</city>");
                sb.append("<city>上海</city>");
                sb.append("<city>深圳</city>");
                sb.append("<city>杭州</city>");
                sb.append("<city>广州</city>");

            }else if("美国".equals(str)){
                sb.append("<city>华盛顿</city>");
                sb.append("<city>加州</city>");
                sb.append("<city>休斯敦</city>");
                sb.append("<city>芝加哥</city>");
                sb.append("<city>纽约</city>");

            }
            sb.append("</root>");
        }else{
            sb.append("{");
            sb.append("\"cities\":[");
            if("中国".equals(str)){
                sb.append("{\"city\":\"北京\"},{\"city\":\"上海\"},{\"city\":\"深圳\"},{\"city\":\"杭州\"},{\"city\":\"广州\"}");

            }else if("美国".equals(str)){
                sb.append("{\"city\":\"华盛顿\"},{\"city\":\"加州\"},{\"city\":\"休斯敦\"},{\"city\":\"芝加哥\"},{\"city\":\"纽约\"}");
            }
            sb.append("]}");
            response.setContentType("text/html;charset=utf-8");
        }

        PrintWriter writer = response.getWriter();
        writer.write(sb.toString());
        writer.flush();
        writer.close();
    }
}
