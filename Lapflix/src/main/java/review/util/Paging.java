package review.util;

public class Paging {
	private int nowPage, //현재페이지 값. cPage값이 nowPage값으로 들어옴
				rowTotal, //총 게시물 수
				blockList, //한 페이지에 표현할 게시물 수
				blockPage, //한 블럭당 표현할 페이지 수
				totalPage, //총 페이지 수
				startPage, //시작 페이지
				endPage, //끝 페이지
				begin, //시작 게시물의 행번호
				end; //끝 게시물의 행번호
	private boolean isPrePage; //이전 기능 가능여부. 이전으로 버튼 눌렀을 때
	private boolean isNextPage; //다음 기능 가능여부. 다음으로 버튼 눌렀을 때
	private String laptop_seq;
	private String searchType, searchValue;
	
	//JSP에서 표현할 페이징 HTML코드를 저장할 곳! list.jsp의 ol부분
	private StringBuffer sb; //문자열 수정

	public Paging(int nowPage, int rowTotal, int blockList, int blockPage, String searchType, String searchValue) {
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		
		//이전기능과 다음기능을 초기화한다.
		isPrePage = false;
		isNextPage = false;
		
		//입력된 전체 게시물의 수를 통해 전체 페이지 수를 구한다.
		/*otalPage = rowTotal/blockList;
		if(rowTotal%blockList != 0)
			totalPage++;
		*/
		totalPage = (int)Math.ceil((double)rowTotal/blockList);
					//ceil의 인자의 형식은 double이다.
					//rowTotal/blockList의 값이 소숫점이 없을 수 있으므로 double로 강제 형변환
		//현재 페이지의 값이 전체페이지의 값보다 크다면 전체 페이지값을 현재 페이지 값으로 지정한다.
		if(nowPage > totalPage)
			nowPage = totalPage;
		
		//현재 블럭에 시작페이지값과 끝페이지 값을 구한다. 
		startPage = ((nowPage-1)/blockPage*blockPage+1);
		endPage = startPage + blockPage - 1;//유지보수를 용이하게 하기 위해
		
		//끝페이지의 값이 전체 페이지의 값보다 크면 끝페이지의 값을 전체페이지 값으로 지정한다.
		if(endPage > totalPage)
			endPage = totalPage;
		
		//현재 페이지 값에 의해 시작게시물의 행번호와 끝게시물의 행번호를 지정하여 
		//현재 페이지에 보여질 게시물 목록을 얻을 준비를 하자!
		begin = (nowPage-1)*blockList+1;
		end = begin + blockList-1;
		//Mybatis 특성상 end값보다 총 게시물이 적다면 알아서 표시하지 않는다.
		
		//이전기능 가능여부 확인(startPage가 1이 아닌경우)
		if(startPage > 1)
			isPrePage = true;
		
		//다음기능 가능여부 확인(endPage가 totalPage보다 작은 경우)
		if(endPage < totalPage)
			isNextPage = true;
		
		//이제 현재페이지 값도 알고, 시작페이지와 끝페이지 값을 알았으니 페이징 기법에 사용할
		//HTML코드를 작성하여 StringBuffer에 저장하자!
		sb = new StringBuffer();//쌍따옴표를 홑따옴표로
		
		
		//searchType과 searchValue의 유무
		if(searchType == null && searchValue == null) {
			if(isPrePage) {
				sb.append("<a class='pagebtn' href='review'>첫 페이지</a>");
				sb.append("<a class='pagebtn' href='review?cPage=");
				sb.append(startPage-blockPage);
				sb.append("'>이전 페이지</a>");
			}else {
				sb.append("<a class='disable'>첫 페이지</a>");
				sb.append("<a class='disable'>이전 페이지</a>");
				
			}
			//페이지 번호 출력하는 반복문
			for(int i=startPage; i <= endPage; i++) {
				if(i == nowPage) {
					sb.append("<a class='pageNum on'>");
					sb.append(i);
					sb.append("</a>");
				}else {
					sb.append("<a class='pageNum' href='review?cPage=");
					sb.append(i);
					sb.append("'>");
					sb.append(i);//화면에 표시되는 부분
					sb.append("</a>");
				}
			}//for의 끝!
			
			//다음기능
			if(isNextPage) {
				sb.append("<a class='pagebtn' href='review?cPage=");
				sb.append(startPage+blockPage);
				sb.append("'>다음 페이지</a>");
				
				//마지막 페이지
				sb.append("<a class='pagebtn' href='review?cPage=");
				sb.append(totalPage);
				sb.append("'>마지막 페이지</a>");
			}else {
				sb.append("<a class='disable'>다음 페이지</a>");
				sb.append("<a class='disable'>마지막 페이지</a>");
			}
		}else if(searchType != null && searchValue != null) {
			if(isPrePage) {
				sb.append("<a class='pagebtn' href='review?searchType="+searchType+"&searchValue="+searchValue+"&cPage=");
				sb.append(startPage-blockPage);//항상 블록페이지가 넘어갈 때 시작페이지로 간다.
				sb.append("'>이전 페이지</a>"); //&lt;는 꺾새기호
			}else {				
				sb.append("<a class='disable'>이전 페이지</a>");
			}
			
			//페이지 번호 출력하는 반복문(현재 페이지에는 now라는 css클래스 적용하자)
			for(int i=startPage; i <= endPage; i++) {
				//i의 값이 현재페이지(nowPage)와 같을 때를 구별하여 css클래스를 적용!
				if(i == nowPage) {
					sb.append("<a class='pageNum on'>");
					sb.append(i);
					sb.append("</a>");
				}else {
					sb.append("<a class='pageNum' href='review?searchType="+searchType+"&searchValue="+searchValue+"&cPage=");
					sb.append(i);
					sb.append("'>");
					sb.append(i);//화면에 표시되는 부분
					sb.append("</a>");
				}
			}//for의 끝!
			
			//다음기능
			if(isNextPage) {
				sb.append("<a class='pagebtn' href='review?searchType="+searchType+"&searchValue="+searchValue+"&cPage=");
				sb.append(startPage+blockPage);//항상 블록페이지가 넘어갈 때 시작페이지로 간다.
				sb.append("'>다음 페이지</a>"); //&lt;는 꺾새기호
			}else {
				sb.append("<a class='disable'>다음 페이지</a>");
			}
		}
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getRowTotal() {
		return rowTotal;
	}

	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}

	public int getBlockList() {
		return blockList;
	}

	public void setBlockList(int blockList) {
		this.blockList = blockList;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public boolean isPrePage() {
		return isPrePage;
	}

	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}

	public boolean isNextPage() {
		return isNextPage;
	}

	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}
	
	public String getLaptop_seq() {
		return laptop_seq;
	}

	public void setLaptop_seq(String laptop_seq) {
		this.laptop_seq = laptop_seq;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}	
	
}
