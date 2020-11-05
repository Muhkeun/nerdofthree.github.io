package mybatis.vo;

public class MemberVO {
	
	String  member_name,
			member_age,
			member_gender,
			f_key,
			email,
			profile_image,
			password,
			seq;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_age() {
		return member_age;
	}

	public void setMember_age(String member_age) {
		this.member_age = member_age;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getF_key() {
		return f_key;
	}

	public void setF_key(String f_key) {
		this.f_key = f_key;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	
			
	
}
