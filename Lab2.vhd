library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Lab2 is 
        port (
            clk: in  std_logic;                              
				dig1: out std_logic_vector(7 downto 0);
				dig2: out std_logic_vector(7 downto 0);
				dig3: out std_logic_vector(7 downto 0);
            reset: in  std_logic);
end entity;

architecture arch of Lab2 is 
    
    component lab2_qsys is
        port (
            clk_clk       : in  std_logic                    := 'X'; -- clk
            s1_export     : out std_logic_vector(3 downto 0);        -- export
            reset_reset_n : in  std_logic                    := 'X'; -- reset_n
            sw_export     : in  std_logic                    := 'X'; -- export
            s2_export     : out std_logic_vector(3 downto 0);        -- export
            s3_export     : out std_logic_vector(3 downto 0)         -- export
        );
    end component lab2_qsys;

	 
	 component dec is
		port (
			n : in std_logic_vector(3 downto 0);
			dig : out std_logic_vector(7 downto 0)
			);
	end component dec;
	
	signal pio_dec1 : std_logic_vector(3 downto 0);
	signal pio_dec2: std_logic_vector(3 downto 0);
	signal pio_dec3 : std_logic_vector(3 downto 0);
	 
begin

	u0 : component lab2_qsys
        port map (
            clk_clk       => clk,       --   clk.clk
            s1_export     => pio_dec1,     --    s1.export
            reset_reset_n => reset, -- reset.reset_n
            sw_export     => reset,     --    sw.export
            s2_export     => pio_dec2,     --    s2.export
            s3_export     => pio_dec3      --    s3.export
        );
  	  
		  
	u1 : component dec
        port map (
            n => pio_dec1,
				dig => dig1
        );
	
	u2 : component dec
        port map (
            n => pio_dec2,
				dig => dig2
        );
		  
	u3 : component dec
        port map (
            n => pio_dec3,
				dig => dig3
        );

end architecture; 