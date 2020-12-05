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
	public ReviewVO[] getList(int begin, int end, String bname, String searchType, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("bname", bname);
		
		if(searchType != null && searchValue != null) {
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
		}
		
		List<ReviewVO> list = sst.selectList("review.reviewList", map);
		
		ReviewVO[] rar = null;
		if(list != null && list.size() > 0) {
			rar = new ReviewVO[list.size()];
			
			list.toArray(rar);
		}
		return rar;
	}
	
	//전체 게시물의 수를 반환하는 기능
	public int totalCount(String bname, String searchType, String searchValue) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("bname", bname);
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		int cnt = sst.selectOne("review.totalCount", map);
		
		return cnt;
	}
	
	//원글 저장
	public void add(ReviewVO rvo) {
		
		int cnt = sst.insert("review.addReview", rvo);
	}
	
	//보기 기능
	public ReviewVO getReview(String r_idx) {
		ReviewVO rvo = sst.selectOne("review.getReview", r_idx);
		
		return rvo;
	}
	
	//수정기능
	public boolean editReview(ReviewVO rvo) {
		boolean value = false;
		
		int cnt = sst.update("review.editReview", rvo);
		
		if(cnt > 0) {
			value = true;
		}
		return value;
	}
	
	//삭제기능
	public void delReview(String r_idx) {
		int cnt = sst.update("review.delReview", r_idx);
	}
	
	//조회수 증가
	public boolean updateHit(String r_idx) {
		int cnt = sst.update("review.update_hit", r_idx);
		boolean value = false;
		if(cnt > 0) {
			value = true;
		}
		return value;
	}
	
}
