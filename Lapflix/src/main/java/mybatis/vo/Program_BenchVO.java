package mybatis.vo;

public class Program_BenchVO {
	
		private String  program_Name;
		private int program_Cpu_min,  
					program_Gpu_min;
					
		public String getProgram_Name() {
			return program_Name;
		}
		public void setProgram_Name(String program_Name) {
			this.program_Name = program_Name;
		}
		public int getProgram_Cpu_min() {
			return program_Cpu_min;
		}
		public void setProgram_Cpu_min(int program_Cpu_min) {
			this.program_Cpu_min = program_Cpu_min;
		}
		
		public int getProgram_Gpu_min() {
			return program_Gpu_min;
		}
		public void setProgram_Gpu_min(int program_Gpu_min) {
			this.program_Gpu_min = program_Gpu_min;
		}

		
}
