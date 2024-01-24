
module lab2_qsys (
	clk_clk,
	reset_reset_n,
	s1_export,
	s2_export,
	s3_export,
	sw_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[3:0]	s1_export;
	output	[3:0]	s2_export;
	output	[3:0]	s3_export;
	input		sw_export;
endmodule
