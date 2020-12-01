package mybatis.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private String r_idx,
			subject,
			writer,
			content,
			file_name,
			write_date,
			ip,
			hit,
			status,
			laptop_name;
	
	private MultipartFile file;
	private int cPage;
	
	private List<CommVO> c_list;//원글에 포함된 댓글들...
	public String getR_idx() {
		return r_idx;
	}
	public void setR_idx(String r_idx) {
		this.r_idx = r_idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLaptop_name() {
		return laptop_name;
	}
	public void setLaptop_name(String laptop_name) {
		this.laptop_name = laptop_name;
	}
	public List<CommVO> getC_list() {
		return c_list;
	}
	public void setC_list(List<CommVO> c_list) {
		this.c_list = c_list;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getcPage() {
		return cPage;
	}
	public void setcPage(int cPage) {
		this.cPage = cPage;
	}
	
}
