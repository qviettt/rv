module core_tb;

 `define TESTING

 reg clk;
 reg reset;
 integer k;
 reg [9:0] cycles;
 core_top rv32i (clk, reset);
/*wire [31:0] pc = rv32i.main_core.pc;
wire [31:0] rst = rv32i.main_core.ext_reset;
wire [31:0] pc_out = rv32i.main_core.pc_latch.Q;
 wire [31:0] new_pc = rv32i.main_core.new_pc_in;
 wire [31:0] insn_addr = rv32i.insn_memory.insn_addr;
 wire [31:0] insn = rv32i.insn_memory.insn;
 wire [31:0] rs1_val = rv32i.main_core.register_file.rs1_val;
 wire [31:0] rs2_val = rv32i.main_core.register_file.rs2_val;
 wire [31:0] rd_addr = rv32i.main_core.register_file.rd;
 wire [31:0] rd_val = rv32i.main_core.register_file.rd_val;
 wire [31:0] rs1 = rv32i.main_core.register_file.rs1;
 wire [31:0] rs2 = rv32i.main_core.register_file.rs2;
 wire [31:0] imem_rs1 = rv32i.main_core.core_control.rs1;
 wire [31:0] imem_rs2 = rv32i.main_core.core_control.rs2;
 wire [31:0] imem_rd = rv32i.main_core.core_control.rd;
 wire [31:0] rd_sel = rv32i.main_core.rd_mux.sel;
 wire [31:0] instruction = rv32i.main_core.instruction_mux_out;
 wire [31:0] alu_a = rv32i.main_core.mux_a_out;
 wire [31:0] alu_b = rv32i.main_core.mux_b_out;
 wire [31:0] alu_out = rv32i.main_core.alu_out;
 wire [31:0] r0 = rv32i.main_core.register_file.regFile[0];
 wire [31:0] r1 = rv32i.main_core.register_file.regFile[1];
 wire [31:0] r2 = rv32i.main_core.register_file.regFile[2];
 wire [31:0] r3 = rv32i.main_core.register_file.regFile[3];
*/ 

  always @(posedge clk or negedge reset) 
 begin
 	if(~reset) begin
 		 cycles <= 0;
 	end else begin
 		 cycles <= cycles+1 ;
 	end
 end

 //initial #12000 $finish;
 
 //Reset at beginning
 initial
 	begin
	 	reset=1;
		#5 reset =0;
		#25 reset =1;
		#5 clk = 0;
	end 
/*
 //Clock Generation
 initial
 	begin
	 	clk = 0;
 		repeat (100)
 			begin
 				#20 clk = 1; 
 				#20 clk = 0;
 			end
	end 
*/
always begin
  #20 clk = ~clk;
end
initial begin
  $readmemh("test.bin",rv32i.insn_memory.mem);
end
 endmodule


