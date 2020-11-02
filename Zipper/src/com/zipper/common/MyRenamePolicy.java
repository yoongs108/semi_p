package com.zipper.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		// 파일의 이름을 받아와
		// 새로운 이름의 파일로 바꿔주는 메소드
		
		// 컴퓨터의 시간 가져오기
		long currentTime = System.currentTimeMillis();
		
		// 시간 형식 표현
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		// 같은 이름의 파일 생성을 방지하기 위한 난수
		int randomNumber = (int)(Math.random() * 10000);
		
		// test.jpg --> test / .jpg (확장자) 떼고 파일 이름만 바꾸기
		String name = oldFile.getName();
		String body = ""; // 파일 명
		String ext = ""; // 확장자
		
		int dot = name.lastIndexOf('.'); // test.jpg.zip >> 뒤에서부터 찾음
		
		if(dot != -1) {
			// 확장자가 있다면
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else {
			body = name;
		}
		
		// 파일 명 바 꾸기
		String fileName = sdf.format(new Date(currentTime))
						  + "_" + randomNumber + ext;
		
		File newFile = new File(oldFile.getParentFile(), fileName);
		
		return newFile;
	}

}
