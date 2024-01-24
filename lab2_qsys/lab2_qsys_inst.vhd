	component lab2_qsys is
		port (
			clk_clk       : in  std_logic                    := 'X'; -- clk
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			s1_export     : out std_logic_vector(3 downto 0);        -- export
			s2_export     : out std_logic_vector(3 downto 0);        -- export
			s3_export     : out std_logic_vector(3 downto 0);        -- export
			sw_export     : in  std_logic                    := 'X'  -- export
		);
	end component lab2_qsys;

	u0 : component lab2_qsys
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			s1_export     => CONNECTED_TO_s1_export,     --    s1.export
			s2_export     => CONNECTED_TO_s2_export,     --    s2.export
			s3_export     => CONNECTED_TO_s3_export,     --    s3.export
			sw_export     => CONNECTED_TO_sw_export      --    sw.export
		);

