package mybatis.vo;

public class LaptopParamVO {
	private String laptop_OS,
				laptop_MonitorSize;
	
	private int cpu_Point,
				gpu_Point;
	
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
	
}
