package utils;

import java.util.List;

import ljf.pojo.Exam;

import org.apache.poi.hssf.record.formula.functions.T;

import com.alibaba.fastjson.*;
public class JsonTools {
	 public static String createJsonString(Object value){  
	        return  JSON.toJSONString(value);
	    }  
	 public static List<Exam> getListByJson(String json){
		 return JSON.parseArray(json, Exam.class);
	 }
}




