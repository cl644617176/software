package ljf.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ljf.pojo.Exam;
import ljf.pojo.Grade;
import ljf.service.ExamService;
import ljf.service.GradeService;
import ljf.service.impl.ExamServiceImpl;
import ljf.service.impl.GradeServiceImpl;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;

public class DownLoadAction extends ActionSupport implements
		ServletRequestAware, ServletResponseAware {

	private HttpServletResponse resp;
	private HttpServletRequest req;
	private GradeService gs=new GradeServiceImpl();
	private ExamService es=new ExamServiceImpl();
	
	public String name;
	public String gid;

	public void Dow() throws ServletException, IOException {
		SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		Grade grade=gs.getById(gid);
		List<Exam> listExam=es.find("from Exam where gid='"+gid+"'");
		
		// 创建一个EXCEL
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建一个SHEET
		HSSFSheet sheet1 = null;
		sheet1 = wb.createSheet(name+"测试结果详情");
		sheet1.setColumnWidth(1, 40*256);
		sheet1.setColumnWidth(3, 20*256);
		
		 HSSFFont font = wb.createFont();  
	     font.setFontHeightInPoints((short)24);  
	     font.setFontName("宋体");  
	     font.setColor(HSSFColor.BLACK.index);  
	     font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
	          
	     HSSFCellStyle style = wb.createCellStyle();  
	        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
	        style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);  
	        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);  
	       // style.setBorderBottom(HSSFCellStyle.BORDER_THICK);  
	        style.setFont(font);  
	        
	        int iRow = 0;//行号  
	        int iMaxCol = 10;//最大列数  
		
	    HSSFRow row = sheet1.createRow(0); 
		HSSFCell cell0 = row.createCell((short)0); 
		cell0.setCellValue(new HSSFRichTextString("测试时间："+sdf.format(grade.getGstarttime())+"  得分："+grade.getGscore()));  
		cell0.setCellStyle(style);
		sheet1.addMergedRegion(new Region(iRow,(short)0,iRow,(short)(iMaxCol-1)));  
		
		
		//sheet1 = wb.createSheet("测试结果详情");
		String[] title = { "题号", "测试题目", "所填答案",
				"正确答案", "正确与否"};
		
		int i = 1;
		int j = 0;
		HSSFRow row0 = sheet1.createRow(i);
		// 填充标题
		i=0;
		for (String s : title) {
			HSSFCell cell = row0.createCell(i);
			cell.setCellValue(s);
			i++;
		}
		// 创建一行
		i=2;
		for (j=0; j <listExam.size(); j++) {
			HSSFRow row1 = sheet1.createRow(i++);
			Exam exam=listExam.get(j);
			// 下面是填充数据
			row1.createCell(0).setCellValue(j+1);
			row1.createCell(1).setCellValue(exam.getExam()+"=");
			row1.createCell(2).setCellValue(exam.getStudentanswer());
			row1.createCell(3).setCellValue(exam.getTrueresult());
			if(exam.getStudentanswer().equals(exam.getTrueresult())){
				row1.createCell(4).setCellValue("√");
			}else{
				row1.createCell(4).setCellValue("×");
			}
			
		}
		String realPath=ServletActionContext.getServletContext().getRealPath("/exam");
		FileOutputStream fileOut = new FileOutputStream(realPath+"/"+gid+".xls");
		wb.write(fileOut);
		fileOut.close();
		
		
		// 得到要下载的文件名
		String fileName=gid+".xls";
		fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
		File file = new File(realPath + "\\" + fileName);
		FileInputStream in = null ;
		OutputStream out = null ;
		try {
			resp.setHeader("content-disposition", "attachment;filename="
					+ URLEncoder.encode(fileName, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			 in = new FileInputStream(realPath + "\\" + fileName);
			// 创建输出流
			 out = resp.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		
	}

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.req = arg0;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.resp = arg0;
	}

}
