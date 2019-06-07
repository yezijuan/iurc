<%@page import="java.awt.Font"%>
<%@page import="java.util.Random"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.Graphics2D"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int width = 120;
	int height = 50;
	//图片对象
	BufferedImage image = 
	new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	//声明一个图片对象2D
	Graphics2D g = image.createGraphics();
	//设置颜色
	g.setColor(Color.WHITE);
	//画一个实心的矩形
	g.fillRect(0, 0, width, height);
	//画边框
	g.setColor(Color.BLACK);
	g.drawRect(0, 0, width-1, height-1);
	
	//声明随机数对象
	Random r = new Random();
	
	g.setColor(Color.gray);
	for(int i=0;i<200;i++){
		int x = r.nextInt(width);
		int y = r.nextInt(height);
		int x1 = r.nextInt(20);
		int y1 = r.nextInt(20);
		g.drawLine(x, y, x+x1, y+y1);
	}
	
	
	//设置字体
	Font font = new Font("Times new Roman",Font.BOLD,40);
	g.setFont(font);
	
	StringBuilder sb = new StringBuilder();
	int red = 0,green = 0,blue = 0; 
	for(int i=0;i<4;i++){
		int a = r.nextInt(10);
		sb.append(a);
		
		red = r.nextInt(110);
		green = r.nextInt(150);
		blue = r.nextInt(180);
		g.setColor(new Color(red,green,blue));
		g.drawString(a+"", 26*i+10, 40);
	}
	//获取会话对象
	session.setAttribute("Code", sb.toString());
	
	//设置页面
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setContentType("images/jpeg");
	
	ServletOutputStream sos = response.getOutputStream();
	ImageIO.write(image, "jpeg", sos);
	
	sos.close();
	out.clear();
	out = pageContext.pushBody();
	
%>