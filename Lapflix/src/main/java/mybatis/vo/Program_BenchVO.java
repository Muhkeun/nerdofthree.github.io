package mybatis.vo;

public class Program_BenchVO {
	
		String  program_Name, 
				program_Cpu_min, 
				program_Cpu_max, 
				program_Gpu_min, 
				program_Gpu_max;

		public String getProgram_Name() {
			return program_Name;
		}

		public void setProgram_Name(String program_Name) {
			this.program_Name = program_Name;
		}

		public String getProgram_Cpu_min() {
			return program_Cpu_min;
		}

		public void setProgram_Cpu_min(String program_Cpu_min) {
			this.program_Cpu_min = program_Cpu_min;
		}

		public String getProgram_Cpu_max() {
			return program_Cpu_max;
		}

		public void setProgram_Cpu_max(String program_Cpu_max) {
			this.program_Cpu_max = program_Cpu_max;
		}

		public String getProgram_Gpu_min() {
			return program_Gpu_min;
		}

		public void setProgram_Gpu_min(String program_Gpu_min) {
			this.program_Gpu_min = program_Gpu_min;
		}

		public String getProgram_Gpu_max() {
			return program_Gpu_max;
		}

		public void setProgram_Gpu_max(String program_Gpu_max) {
			this.program_Gpu_max = program_Gpu_max;
		}   
}
