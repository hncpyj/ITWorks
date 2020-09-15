package com.kh.itworks.member.model.comparator;

import java.util.Comparator;

import com.kh.itworks.fileBox.model.vo.Storage;

public class AscendingStgPath implements Comparator<Object> {

	@Override
	public int compare(Object o1, Object o2) {
		System.out.println("compare 넘어오니?");
		Storage stg1 = (Storage) o1;
		Storage stg2 = (Storage) o2;
		System.out.println("sth1 : " + stg1);
		System.out.println("sth2 : " + stg2);
		
		
		int s1 = Integer.parseInt(stg1.getStgPath());
		int s2 = Integer.parseInt(stg2.getStgPath());
		System.out.println("s1 : " + s1);
		System.out.println("s2 : " + s2);
		
		int result = 0;
		
		if(s1 == s2) {
			result = 0;
		}
		if(s1 > s2) {
			result = 1;
		}
		if(s1 < s2) {
			result = -1;
		}
		System.out.println("result : " + result);
		return result;
	}
}
