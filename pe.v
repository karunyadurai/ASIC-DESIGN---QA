`default_nettype none
module priority_encoder (
    input en,        
    input [7:0] in,   
    output eno, gs,   
    output reg [2:0] out
);
    wire active_input;
    assign active_input = |in;
    assign eno = ~(active_input & en);
    assign gs = ~eno & en;
    always @(*) begin
        if (en) begin
            casex (in)
                8'b00000000: out = 3'bzzz; 
                8'b00000001: out = 3'b000; 
                8'b0000001x: out = 3'b001;
                8'b000001xx: out = 3'b010;
                8'b00001xxx: out = 3'b011;
                8'b0001xxxx: out = 3'b100;
                8'b001xxxxx: out = 3'b101;
                8'b01xxxxxx: out = 3'b110;
                8'b1xxxxxxx: out = 3'b111; 
                default: out = 3'bzzz;
            endcase
        end else begin
            out = 3'bzzz; 
        end
    end

endmodule

`default_nettype wire
