package com.kim.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

public class PagingUtil {
	
	public static HashMap<String, Integer> setPaging(String clickedPage, int total) {
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		
		if (clickedPage == null) {
			clickedPage = "1";
		}
		int pagePerCount = 9;  // 한번에 보여줄때 몇개 가지고올꺼야?
		int numbering 	 = 0;
		int currentPage  = Integer.parseInt(clickedPage);
		
		int start = (currentPage - 1) * pagePerCount + 1;
		int end   = currentPage * pagePerCount;
		
		int paginationTotal = (int) Math.floor(total / pagePerCount) + 1;
		int pageGroup 		= 10;
		int startPage 		= 1;
		
		numbering = total - (currentPage - 1) * pagePerCount;

		if (currentPage % pageGroup != 0) {
			startPage = (int) (currentPage / pageGroup) * pageGroup + 1;
		} else {
			startPage = ((int) (currentPage / pageGroup) - 1) * pageGroup + 1;
		}
		
		int endPage = startPage + pageGroup - 1;
		
		if (endPage > paginationTotal) {
			endPage = paginationTotal;
		}
		
		hashMap.put("start", start);
		hashMap.put("end", end);
		hashMap.put("pageGroup", pageGroup);
		hashMap.put("startPage", startPage);
		hashMap.put("endPage", endPage);
		hashMap.put("numbering", numbering);
		hashMap.put("currentPage", currentPage);
		
		return hashMap;
	}
}
