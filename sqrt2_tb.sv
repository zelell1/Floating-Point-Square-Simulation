`include "sqrt2.sv"

module sqrt2_tb; 
	reg CLK = 0;
    reg[15:0] IO_DATA;
    reg IS_NAN;
    reg IS_PINF;
    reg IS_NINF;
    reg RESULT;
    reg ENABLE = 0;
	reg[31:0] test_cnt = 0;
	reg [31:0] t;
	wire[15:0] data;
	assign data = IO_DATA;
	sqrt2 algorithm (
		.IO_DATA(data),
		.IS_NAN(IS_NAN),
		.IS_PINF(IS_PINF),
		.IS_NINF(IS_NINF),
		.RESULT(RESULT),
		.CLK(CLK),
		.ENABLE(ENABLE)
	);


	integer fd;

	initial begin
		fd = $fopen("sqrt2_log.csv", "w");
		
		$fstrobe(fd, "\n==================== [ POSITIVE ZERO ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'h0000;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ NEGATIVE ZERO ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'h8000;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ NEGATIVE NUMBER ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'h8bbb;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ NINF ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'hfc00;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ NAN ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'h7d80;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ PINF ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'h7c00;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ NORMAL ] =============================");
		#0
		ENABLE = 0;
		IO_DATA = 16'h6666;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h5d5f;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h3033;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0400;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h57e1;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h4bc5;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h4a79;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h4407;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h41b9;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0c20;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h14ff;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h1b24;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h2cce;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h357f;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h3eb6;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h4707;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		$fstrobe(fd, "\n==================== [ DENORMAL ] =============================");

		#0
		ENABLE = 0;
		IO_DATA = 16'h0001;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0002;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0003;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0004;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h003b;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h003b;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h00d7;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0117;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h020d;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;	

		#0
		ENABLE = 0;
		IO_DATA = 16'h03b4;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;	

		#0
		ENABLE = 0;
		IO_DATA = 16'h03e9;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h03ff;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

		#0
		ENABLE = 0;
		IO_DATA = 16'h0099;
		ENABLE = 1;
        #2;
        IO_DATA = 16'hzzzz;	
		#22;

        $fclose(fd);
        $finish;
	end

	always #1 CLK = ~CLK;
	always @(posedge CLK) begin
		if (ENABLE) begin
			$fstrobe(fd,
				"time=%0t clk=%0d result=%0d is_nan=%0d is_pinf=%0d is_ninf=%0d io_data=0x%04h",
				 $time ,CLK, RESULT, IS_NAN, IS_PINF, IS_NINF, data
			);
		end
	end

	always @(posedge ENABLE) begin
		if (test_cnt == 0) begin 
			$fstrobe(fd, "TEST NUMBER: %0d\n", test_cnt);
		end else begin 
			$fstrobe(fd, "\nTEST NUMBER: %0d\n", test_cnt);
		end
		test_cnt += 1;
    end

endmodule
