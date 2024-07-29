`include "mips_isa.v"
module control(
    input [5:0] instruction,
    input [5:0] funct,
    input zero,
    output reg reg_dst,
    output reg jump,
    output reg branch,
    output reg memRead,
    output reg mem2Reg,
    output reg [2:0] ALUop,
    output reg memWrite,
    output reg ALUsrc,
    output reg regWrite,
    output reg signXtend);

always @(*)
    begin
        casex(instruction)
            `R_TYPE:    
                begin
                    reg_dst =   1'b1;
                    jump =      1'b0;
                    branch =    1'b0;
                    memRead =   1'b0;
                    mem2Reg =   1'b0;
                    memWrite =  1'b0;
                    ALUsrc =    1'b0;
                    regWrite =  1'b1;
                    signXtend = (funct[0]) ? 1'b0 : 1'b1;
                    ALUop =     3'b111; // NOP
                    
                    casex(funct)              
                        6'b00100X:  // Jump
                            jump =      1'b1;
                    endcase
                end
            
            `J:
                begin
                    reg_dst =   1'b0;
                    jump =      1'b1;
                    branch =    1'b0;
                    memRead =   1'b0;
                    mem2Reg =   1'b0;
                    memWrite =  1'b0;
                    ALUsrc =    1'b0;
                    regWrite =  1'b1;
                    ALUop =     3'b111;  
                    signXtend = 1'b0;       
                casex(funct)
                    6'b000011: //JAL //TODO: implementar JAL
                endcase
                end
                
            
                
            6'b0001XX:  // Branch Instructions
                begin
                    reg_dst =   1'b0;
                    branch =    1'b1;
                    memRead =   1'b0;
                    mem2Reg =   1'b0;
                    memWrite =  1'b0;
                    ALUsrc =    1'b1;
                    regWrite =  1'b0;
                    
                    case(instruction)
                        `BNE:
                            ALUop =     3'b110;
                        default:
                            ALUop =     3'b110;
                    endcase
                end
            
            //TODO Complete Load and Store instructions
            6'b100XXX:  // Load Instructions
                begin
                    reg_dst =   1'b0;
                    branch =    1'b0;
                    jump =      1'b0;
                    memRead =   1'b1;
                    mem2Reg =   1'b1;
                    memWrite =  1'b0;
                    ALUsrc =    1'b1;
                    regWrite =  1'b1;
                    ALUop =     3'b000;
                    signXtend = 1'b1;
                end
                
            6'b1010XX:  // Store Instructions
                begin
                   reg_dst =    1'b0;
                    branch =    1'b0;
                    jump =      1'b0;
                    memRead =   1'b0;
                    mem2Reg =   1'b0;
                    memWrite =  1'b1;
                    ALUsrc =    1'b1;
                    regWrite =  1'b0;
                    ALUop =     3'b000;
                    signXtend = 1'b1; 
                end
                
            default:    
                begin
                    reg_dst =   1'b0;
                    branch =    1'b0;
                    memRead =   1'b0;
                    mem2Reg =   1'b0;
                    memWrite =  1'b0;
                    ALUsrc =    1'b0;
                    regWrite =  1'b1;
                    ALUop =     3'b111;
                end
        endcase
    end

endmodule