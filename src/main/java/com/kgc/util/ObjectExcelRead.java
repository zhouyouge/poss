package com.kgc.util;

import com.kgc.entity.ExportData;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;


public class ObjectExcelRead {
    /**
     * 
     * @param filepath 文件路径
     * @param filename 文件名
     * @param startrow 开始行号 从0开始
     * @param startcol 开始列号 从0开始
     * @param sheetnum sheet
     * @param
     * @return
     */
    public static List<Object> readExcel(String filepath, String filename, int startrow, int startcol, int sheetnum) throws Exception {
        List<Object> varList = new ArrayList<Object>();//泛型可以改为ExportData
        Workbook workbook = null;
        try {
        	//HSSFWorkbook支持.xls，XSSFWorkbook支持.xlsx
//            HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(filepath, filename)));
            try {
            	workbook = new XSSFWorkbook(new FileInputStream(new File(filepath, filename)));
            } catch (Exception ex) {
            	workbook = new HSSFWorkbook(new FileInputStream(new File(filepath, filename)));
            }
            
            Sheet sheet =  workbook.getSheetAt(sheetnum);                //sheet 从0开始
            int rowNum = sheet.getLastRowNum() + 1;                     //取得最后一行的行号
            System.out.println("rowNum:"+rowNum);

            for (int i = startrow; i<rowNum; i++) {                    //行循环开始
            	ExportData varpd = new ExportData();
                Row row =  sheet.getRow(i);                             //行 getRow()默认从0开始
                if(row==null) break; //中间如果有空行，则退出
                int cellNum = row.getLastCellNum();                     //每行的最后一个单元格位置
                System.out.println("cellNum:"+cellNum);
                System.out.println("startcol:"+startcol);
                
                for (int j = startcol; j <cellNum; j++) {              //列循环开始
                    Cell cell = row.getCell(Short.parseShort(j + ""));//getCell()默认从0开始
                    String cellValue = null;
                    if(null!=cell){
                    	System.out.println("++++++"+cell.getCellType());
                    	switch(cell.getCellType()){
                    		case 0:
                    			cellValue=String.valueOf((int)cell.getNumericCellValue());
                    			break;
                    		case 1:
                    			cellValue=cell.getStringCellValue();
                    			break;
                    		case 2:
                    			cellValue=cell.getNumericCellValue()+"";
                    			break;
                    		case 3:
                    			cellValue="";
                    			break;
                    		case 4:
                    			cellValue=String.valueOf(cell.getBooleanCellValue());
                    			break;
                    		case 5:
                    			cellValue=String.valueOf(cell.getErrorCellValue());
                    			break;
                    	}
                    }else{
                    	cellValue="";
                    }
                    
                    varpd.put("var"+j, cellValue);
                }
                varList.add(varpd);
            }
        } catch (Exception e) {
        	System.out.println("解析文件出错");
            throw e;
        }
        return varList;
    }
    
}
