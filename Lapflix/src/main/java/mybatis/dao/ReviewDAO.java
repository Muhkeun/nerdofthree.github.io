package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mybatis.vo.ReviewVO;

@Component
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	//페이징을 위한 목록 기능
	public ReviewVO[] getList(int begin, int end, String bname) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("bname", bname);
		
		List<ReviewVO> list = sst.selectList("review.list", map);
		
		ReviewVO[] rar = null;
		if(list != null && list.size() > 0) {
			rar = new ReviewVO[list.size()];
			
			list.toArray(rar);
		}
		return rar;
	}
	
	//전체 게시물의 수를 반환하는 기능
	public int totalCount(String bname) {
		int cnt = sst.selectOne("review.totalCount", bname);
		
		return cnt;
	}
	
	//원글 저장
	public void add(String subject, String writer, String content,
			String file_name, String ip, String laptop_name, String bname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("writer", writer);
		map.put("content", content);
		map.put("file_name", file_name);
		map.put("ip", ip);
		map.put("laptop_name", laptop_name);
		map.put("bname", bname);
		
		int cnt = sst.insert("review.add", map);
	}
	
}
