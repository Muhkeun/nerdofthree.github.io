package mybatis.vo;

public class LaptopVO {
	private String  laptop_Name, 
    		cpu_Name, 
    		gpu_Name, 
    		laptop_Memory, 
    		laptop_OS, 
    		laptop_MonitorSize;

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
  
}
