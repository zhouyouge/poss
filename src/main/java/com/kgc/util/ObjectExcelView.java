package com.kgc.util;


import com.kgc.entity.ExportData;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class ObjectExcelView extends AbstractExcelView{
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
	HSSFWorkbook workbook, HttpServletRequest request,
	HttpServletResponse response) throws Exception {
		Date date = new Date();
//		String filename = Tools.date2Str(date,"yyyyMMddHHmmss");
		String filename = (new SimpleDateFormat("yyyyMMddHHmmss")).format(date);
		HSSFSheet sheet;
		HSSFCell cell;
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename+".xls");
		sheet = workbook.createSheet("sheet1");
	
		List<String> titles = (List<String>)model.get("titles");
		
		int len = titles.size();
		HSSFCellStyle headerStyle = workbook.createCellStyle(); //标题样式
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		HSSFFont headerFont = workbook.createFont();//标题字体
		headerFont.setBold(true);
		headerFont.setFontHeightInPoints((short)11);
		headerStyle.setFont(headerFont);
		short width = 20,height=25*20;
		sheet.setDefaultColumnWidth(width);
		for(int i=0; i<len; i++){ //设置标题
			String title = titles.get(i);
			cell = getCell(sheet, 0, i);
			cell.setCellStyle(headerStyle);
			setText(cell,title);
		}
		sheet.getRow(0).setHeight(height);
	
		HSSFCellStyle contentStyle = workbook.createCellStyle(); //内容样式
		contentStyle.setAlignment(HorizontalAlignment.CENTER);
		List<ExportData> varList = (List<ExportData>) model.get("dataList");
		int varCount = varList.size();
		for(int i=0; i<varCount; i++){
			ExportData vpd = varList.get(i);
			for(int j=0;j<len;j++){
			String varstr = vpd.getString("var"+j) != null ? vpd.getString("var"+j) : "";
			cell = getCell(sheet, i+1, j);
			cell.setCellStyle(contentStyle);
			setText(cell,varstr);
		}


		}
	}
}