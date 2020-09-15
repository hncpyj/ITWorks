package com.kh.itworks.fileBox.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.itworks.common.PageInfo;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.member.model.vo.Member;

@Repository
public class FileBoxDaoImpl implements FileBoxDao{


//	@Override
//	public int fileUpload(SqlSessionTemplate sqlSession, FileBox fb, Member loginUser) {
//		System.out.println("dao : " + fb);
//		
//		
//		return sqlSession.insert("FileBox.uploadFiles", fb);
//	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession) {
		System.out.println("dao 넘어오니..?");
		int result = sqlSession.selectOne("FileBox.selectListCount");
		
		System.out.println("dao fileBoxListCount : " + result);
		
//		if(result < 0) {
//			sqlSession.close();
//			
//		}
		return result;
	}

	@Override
	public ArrayList<FileBox> selectFileList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		System.out.println("dao selectFilelist 오니?");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		System.out.println("offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		System.out.println("rowBounds : " + rowBounds);
		
		
		
		ArrayList<FileBox> list = (ArrayList) sqlSession.selectList("FileBox.selectFileList", null, rowBounds);
		
		System.out.println("selectFileDao 다시 왔니??");
		System.out.println(list);

		
		return list;
		
	}
	@Override
	public int getSearchListCount(SqlSessionTemplate sqlSession, FileBox fb) {
		System.out.println("***search getSearchListCount dao 넘어오니..?");
		int result = sqlSession.selectOne("FileBox.searchListCount", fb);
		
		System.out.println("***search dao fileBoxListCount : " + result);
		
//		if(result < 0) {
//			sqlSession.close();
//			
//		}
		return result;
	}
	
	@Override
	public ArrayList<FileBox> searchFileList(SqlSessionTemplate sqlSession, PageInfo pi, FileBox fb) {
		
		System.out.println("***search dao searchFileList 오니?");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		System.out.println("offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		System.out.println("rowBounds : " + rowBounds);
		
		
		
		ArrayList<FileBox> list = (ArrayList) sqlSession.selectList("FileBox.searchFileList", fb, rowBounds);
		
		System.out.println("***search selectFileDao 다시 왔니??");
		System.out.println(list);
		
		
		return list;
		
	}

	@Override
	public int fileUpload(SqlSessionTemplate sqlSession, ArrayList<FileBox> fileArr, Member loginUser) {
		System.out.println("Dao fileupload 넘어오니?");
		System.out.println("dao : " + fileArr);
		
		
		return sqlSession.insert("FileBox.uploadFiles", fileArr);
	}

	@Override
	public HashMap<String, Object> selectOneFile(SqlSessionTemplate sqlSession, String fileNo) {
		System.out.println("Dao file download 넘어오니?");
		HashMap<String, Object> file = sqlSession.selectOne("FileBox.selectOneFile", fileNo);
		System.out.println("Dao file download file : " + file);
		return file;
	}

	@Override
	public int fileDelete(SqlSessionTemplate sqlSession, FileBox fb) {
		System.out.println("Dao file delete 넘어오니?");
		System.out.println("Dao file delete Fileno : " + fb);
		return sqlSession.delete("FileBox.deleteFile", fb);
	}
	
	@Override
	public int fileRestore(SqlSessionTemplate sqlSession, FileBox fb) {
		System.out.println("Dao file fileRestore 넘어오니?");
		System.out.println("Dao file fileRestore Fileno : " + fb);
		return sqlSession.delete("FileBox.fileRestore", fb);
	}
	
	@Override
	public int fileDeleteForever(SqlSessionTemplate sqlSession, FileBox fb) {
		System.out.println("Dao file fileDeleteForever 넘어오니?");
		System.out.println("Dao file fileDeleteForever Fileno : " + fb);
		return sqlSession.delete("FileBox.fileDeleteForever", fb);
	}

	@Override
	public ArrayList<FileBox> selectTrashList(SqlSessionTemplate sqlSession, PageInfo pi) {
System.out.println("dao selectFilelist 오니?");
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		System.out.println("offset : " + offset);
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		System.out.println("rowBounds : " + rowBounds);
		
		
		ArrayList<FileBox> list = (ArrayList) sqlSession.selectList("FileBox.selectTrashList", null, rowBounds);
		
		System.out.println("selectFileDao 다시 왔니??");
		System.out.println(list);

		
		return list;
	}

}
