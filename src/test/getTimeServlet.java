package test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/getTime")
public class getTimeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//是设置从request中取得的值或从数据库中取出的值,只对post有效
        response.setContentType("text/html");//使客户端浏览器，区分不同种类的数据，并根据不同的MIME调用浏览器内不同的程序嵌入模块来处理相应的数据。

        String sendType = request.getParameter("sendType");
        String name = request.getParameter("name");
        String nick = request.getParameter("nick");
        String timeStr = getCurrentTime();
        if("async".equals(sendType)){//异步
            PrintWriter writer = response.getWriter();
            writer.write(getCurrentTime());

            writer.flush();
            writer.close();
        }else {//同步
            request.setAttribute("currentTime",timeStr);
            request.getRequestDispatcher("/showTime.jsp").forward(request,response);
        }


    }


    public static String getCurrentTime(){

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timeStr = df.format(new Date());
        return timeStr;
    }


}


