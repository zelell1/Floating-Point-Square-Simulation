module sqrt2(
    inout   wire[15:0] IO_DATA,
    output  wire IS_NAN,
    output  wire IS_PINF,
    output  wire IS_NINF,
    output  wire RESULT,
    input   wire CLK,
    input   wire ENABLE
    ); 

    reg is_nan = 0;
    reg is_ninf = 0;
    reg is_pinf = 0;
    reg is_zero = 0;
    reg result = 0;
    reg sign = 0;
    reg [4:0] exp = 0;
    reg[9:0] mantissa = 0;
    reg [5:0] new_exp = 0;
    reg[11:0] new_mantissa = 0;
    reg[3:0] cnt = 0;
    reg[4:0] shift = 0;
    reg[11:0] demolished = 0;
    reg[24:0] remainder = 0;
    reg[10:0] result_of_sqrt = 0;
    reg[15:0] ans = 16'hzzzz;
    reg[24:0] temp = 0;

    always @(posedge CLK) begin
        if (ENABLE) begin
            cnt = cnt + 1;
            if (cnt == 1) begin
                sign = IO_DATA[15];
                exp = IO_DATA[14:10];
                mantissa = IO_DATA[9:0];
                new_exp = exp;
                new_mantissa = mantissa;
                if (exp == 0) begin 
                    case (1'b1)
                        new_mantissa[9]: shift = 1;
                        new_mantissa[8]: shift = 2;
                        new_mantissa[7]: shift = 3;
                        new_mantissa[6]: shift = 4;
                        new_mantissa[5]: shift = 5;
                        new_mantissa[4]: shift = 6;
                        new_mantissa[3]: shift = 7;
                        new_mantissa[2]: shift = 8;
                        new_mantissa[1]: shift = 9;
                        new_mantissa[0]: shift = 10;
                    endcase
                    new_mantissa = new_mantissa << shift; 
                    new_exp = 5'he + shift; 
                    if (shift[0] ^ 0 == 1) begin
                        new_mantissa = new_mantissa << 1;
                        new_exp = new_exp + 5'h1;
                    end
                    new_exp = (5'hf - (new_exp >> 1));
                end else begin
                    new_mantissa[10] = 1'b1;
                    new_exp = new_exp + 6'hf;
                    if (exp[0] ^ 0 == 0) begin 
                        new_exp = new_exp - 6'h1;
                        new_mantissa = new_mantissa << 1;
                    end
                    new_exp = new_exp >> 1;
                end
                demolished = new_mantissa;
            end
            if (cnt > 1) begin
                if (sign == 1 && exp == 0 && mantissa == 0) begin
                    ans = 16'h8000;
                    result = 1;
                end else if (sign == 0 && exp == 0 && mantissa == 0) begin
                    ans = 16'h0000;
                    result = 1;
                end else if (sign == 0 && exp == 5'b11111 && mantissa == 10'b0000000000) begin
                    ans = 16'h7c00;
                    is_pinf = 1;
                    result = 1;
                end else if (sign == 1) begin
                    ans = 16'hfe00;
                    is_nan = 1;
                    result = 1;
                end else if (exp == 5'b11111 && mantissa != 0) begin
                    mantissa[9] = 1;
                    ans = (sign << 15) + (exp << 10) + mantissa;
                    is_nan = 1;
                    result = 1;
                end else begin
                    if (cnt <= 12) begin
                        remainder = (remainder << 2) + demolished[11:10];
                        demolished = demolished << 2;
                        result_of_sqrt = (result_of_sqrt << 1);
                        temp = (result_of_sqrt << 1) + 1;
                        if (remainder >= temp) begin 
                            remainder = remainder - temp;
                            result_of_sqrt = (result_of_sqrt + 1);
                        end 
                        ans = (sign << 15) + (new_exp[4:0] << 10) + (result_of_sqrt[9:0]);
                    
                    end
                    if (cnt == 12) begin 
                        result = 1;
                    end
                end
            end 

        end
    end

    always @(negedge ENABLE) begin
        is_nan = 0;
        is_ninf = 0;
        is_pinf = 0;
        is_zero = 0;
        result = 0;
        sign = 0;
        exp = 0;
        mantissa = 0;
        new_exp = 0;
        new_mantissa = 0;
        cnt = 0;
        shift = 0;
        demolished = 0;
        remainder = 0;
        result_of_sqrt = 0;
        ans = 16'hzzzz;     
    end 

    assign IS_NAN = is_nan;
    assign IS_PINF = is_pinf;
    assign IS_NINF = is_ninf;
    assign RESULT = result;
    assign IO_DATA = ans;
endmodule
