package mybatis.vo;

public class LaptopVO {
	private String laptop_seq, 
			laptop_Name, 
    		cpu_Name, 
    		gpu_Name, 
    		laptop_Memory, 
    		laptop_OS, 
    		laptop_MonitorSize,
    		laptop_ImageURL,
    		laptop_url;
	
	public String getLaptop_seq() {
		return laptop_seq;
	}

	public void setLaptop_seq(String laptop_seq) {
		this.laptop_seq = laptop_seq;
	}

	private int cpu_Point,
				gpu_Point,
				laptop_Price;
	
	private float laptop_Weight;
	

	public String getLaptop_Name() {
		return laptop_Name;
	}

	public void setLaptop_Name(String laptop_Name) {
		this.laptop_Name = laptop_Name;
	}

	public String getCpu_Name() {
		return cpu_Name;
	}

	public void setCpu_Name(String cpu_Name) {
		this.cpu_Name = cpu_Name;
	}

	public String getGpu_Name() {
		return gpu_Name;
	}

	public void setGpu_Name(String gpu_Name) {
		this.gpu_Name = gpu_Name;
	}

	public String getLaptop_Memory() {
		return laptop_Memory;
	}

	public void setLaptop_Memory(String laptop_Memory) {
		this.laptop_Memory = laptop_Memory;
	}

	public String getLaptop_OS() {
		return laptop_OS;
	}

	public void setLaptop_OS(String laptop_OS) {
		this.laptop_OS = laptop_OS;
	}

	public String getLaptop_MonitorSize() {
		return laptop_MonitorSize;
	}

	public void setLaptop_MonitorSize(String laptop_MonitorSize) {
		this.laptop_MonitorSize = laptop_MonitorSize;
	}

	public String getLaptop_ImageURL() {
		return laptop_ImageURL;
	}

	public void setLaptop_ImageURL(String laptop_ImageURL) {
		this.laptop_ImageURL = laptop_ImageURL;
	}
	
	public String getLaptop_url() {
		return laptop_url;
	}

	public void setLaptop_url(String laptop_url) {
		this.laptop_url = laptop_url;
	}

	public int getCpu_Point() {
		return cpu_Point;
	}

	public void setCpu_Point(int cpu_Point) {
		this.cpu_Point = cpu_Point;
	}

	public int getGpu_Point() {
		return gpu_Point;
	}

	public void setGpu_Point(int gpu_Point) {
		this.gpu_Point = gpu_Point;
	}

	public float getLaptop_Weight() {
		return laptop_Weight;
	}

	public void setLaptop_Weight(float laptop_Weight) {
		this.laptop_Weight = laptop_Weight;
	}

	public int getLaptop_Price() {
		return laptop_Price;
	}

	public void setLaptop_Price(int laptop_Price) {
		this.laptop_Price = laptop_Price;
	}
	
	
}
