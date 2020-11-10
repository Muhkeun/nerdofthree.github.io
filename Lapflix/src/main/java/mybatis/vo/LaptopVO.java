package mybatis.vo;

public class LaptopVO {
	private String  laptop_Name, 
    		cpu_Name, 
    		gpu_Name, 
    		laptop_Memory, 
    		laptop_OS, 
    		laptop_MonitorSize,
    		laptop_ImageURL;
	
	private int cpu_Point,
				gpu_Point,
				weight,
				price;

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

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
