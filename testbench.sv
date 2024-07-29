`timescale 1ns / 1ps


module MIPS_tb;
    reg clk;
    
    processor mips(
        .clk(clk)
    );
        
    initial 
    begin
      	$dumpfile("dump.vcd");
  		$dumpvars();
      
        // Load 0 into data memory 0
        mips.data_mem.memory[0] = 8'd0;
        mips.data_mem.memory[1] = 8'd0;
        mips.data_mem.memory[2] = 8'd0;
        mips.data_mem.memory[3] = 8'd0;
        // Load 40 into data memory 1
        mips.data_mem.memory[4] = 8'd0;
        mips.data_mem.memory[5] = 8'd0;
        mips.data_mem.memory[6] = 8'd0;
        mips.data_mem.memory[7] = 8'd40;
        
        // INSTRUCTION 1
        mips.my_ins_mem.memory[0] = 8'b00001100;
        mips.my_ins_mem.memory[1] = 8'b00000000;
        mips.my_ins_mem.memory[2] = 8'b00000000;
        mips.my_ins_mem.memory[3] = 8'b00000101;
        
        // INSTRUCTION 2
        mips.my_ins_mem.memory[4] = 8'b00100000;
        mips.my_ins_mem.memory[5] = 8'b00001001;
        mips.my_ins_mem.memory[6] = 8'b00000000;
        mips.my_ins_mem.memory[7] = 8'b00000000;
        
        // INSTRUCTION 3
        mips.my_ins_mem.memory[8] = 8'b00100001;
        mips.my_ins_mem.memory[9] = 8'b00101001;
        mips.my_ins_mem.memory[10] = 8'b00000000;
        mips.my_ins_mem.memory[11] = 8'b00000001;
        
        // INSTRUCTION 4
        mips.my_ins_mem.memory[12] = 8'b00010101;
        mips.my_ins_mem.memory[13] = 8'b00100100;
        mips.my_ins_mem.memory[14] = 8'b00000000;
        mips.my_ins_mem.memory[15] = 8'b00000001;
        
        // INSTRUCTION 5
        mips.my_ins_mem.memory[16] = 8'b00000011;
        mips.my_ins_mem.memory[17] = 8'b11100000;
        mips.my_ins_mem.memory[18] = 8'b00000000;
        mips.my_ins_mem.memory[19] = 8'b00001000;
        
        // INSTRUCTION 6
        mips.my_ins_mem.memory[20] = 8'b10001100;
        mips.my_ins_mem.memory[21] = 8'b00010000;
        mips.my_ins_mem.memory[22] = 8'b00000000;
        mips.my_ins_mem.memory[23] = 8'b00000000;

        // INSTRUCTION 7
        mips.my_ins_mem.memory[24] = 8'b10001100;
        mips.my_ins_mem.memory[25] = 8'b00010001;
        mips.my_ins_mem.memory[26] = 8'b00000000;
        mips.my_ins_mem.memory[27] = 8'b00000100;

        // INSTRUCTION 8
        mips.my_ins_mem.memory[28] = 8'b00100000;
        mips.my_ins_mem.memory[29] = 8'b00001000;
        mips.my_ins_mem.memory[30] = 8'b00000000;
        mips.my_ins_mem.memory[31] = 8'b00000000;

        // INSTRUCTION 9
        mips.my_ins_mem.memory[32] = 8'b00010110;
        mips.my_ins_mem.memory[33] = 8'b00000000;
        mips.my_ins_mem.memory[34] = 8'b00000000;
        mips.my_ins_mem.memory[35] = 8'b00000011;

        // INSTRUCTION 10
        mips.my_ins_mem.memory[36] = 8'b00100000;
        mips.my_ins_mem.memory[37] = 8'b00000100;
        mips.my_ins_mem.memory[38] = 8'b00000000;
        mips.my_ins_mem.memory[39] = 8'b00001010;
        
        // INSTRUCTION 11
        mips.my_ins_mem.memory[40] = 8'b00001100;
        mips.my_ins_mem.memory[41] = 8'b00000000;
        mips.my_ins_mem.memory[42] = 8'b00000000;
        mips.my_ins_mem.memory[43] = 8'b00000001;

        // INSTRUCTION 12
        mips.my_ins_mem.memory[44] = 8'b00001100;
        mips.my_ins_mem.memory[45] = 8'b00000000;
        mips.my_ins_mem.memory[46] = 8'b00000000;
        mips.my_ins_mem.memory[47] = 8'b00001110;
        
        // INSTRUCTION 13
        mips.my_ins_mem.memory[48] = 8'b00100000;
        mips.my_ins_mem.memory[49] = 8'b00000100;
        mips.my_ins_mem.memory[50] = 8'b00000000;
        mips.my_ins_mem.memory[51] = 8'b00010100;

        // INSTRUCTION 14
        mips.my_ins_mem.memory[52] = 8'b00001100;
        mips.my_ins_mem.memory[53] = 8'b00000000;
        mips.my_ins_mem.memory[54] = 8'b00000000;
        mips.my_ins_mem.memory[55] = 8'b00000001;

        // INSTRUCTION 15
        mips.my_ins_mem.memory[56] = 8'b00100001;
        mips.my_ins_mem.memory[57] = 8'b00101000;
        mips.my_ins_mem.memory[58] = 8'b00000000;
        mips.my_ins_mem.memory[59] = 8'b00000001;

        // INSTRUCTION 16
        mips.my_ins_mem.memory[60] = 8'b10101100;
        mips.my_ins_mem.memory[61] = 8'b00001000;
        mips.my_ins_mem.memory[62] = 8'b00000000;
        mips.my_ins_mem.memory[63] = 8'b00001000;

        // INSTRUCTION 17
        mips.my_ins_mem.memory[64] = 8'b00010101;
        mips.my_ins_mem.memory[65] = 8'b00010001;
        mips.my_ins_mem.memory[66] = 8'b00000000;
        mips.my_ins_mem.memory[67] = 8'b00001000;

        clk = 0;
      
      	mips.pc = 32'd0;
      
      	#60;
      	$finish;
    end

    always begin 
        clk = #1 ~clk;
    end
endmodule