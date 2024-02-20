   
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lab1 is
	port (
		clk_clk       : in std_logic ;
		reset_reset_n : in std_logic ;  -- reset_n
		trigger		  : in std_logic ; -- le bouton d'activation du chenillard
		speed			  : in std_logic_vector(3 downto 0); -- les switchs pour gérer la vitesse
		leds			  : out std_logic_vector(7 downto 0) -- la serie de leds à allumer
	);
end entity lab1;


architecture arch_albouquet_lab1 of lab1 is


	component albouquet_lab1 is
        port (
            clk_clk                          : in  std_logic                    := 'X';             -- clk
            pio_0_external_connection_export : out std_logic_vector(7 downto 0);                    -- export
            pio_1_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
            pio_2_external_connection_export : in  std_logic                    := 'X';             -- export
            reset_reset_n                    : in  std_logic                    := 'X'              -- reset_n
        );
    end component albouquet_lab1;

	 begin
	 
    u0 : component albouquet_lab1
        port map (
            clk_clk                          => clk_clk,                          --                       clk.clk
            pio_0_external_connection_export => leds, -- pio_0_external_connection.export
            pio_1_external_connection_export => speed, -- pio_1_external_connection.export
            pio_2_external_connection_export => trigger, -- pio_2_external_connection.export
            reset_reset_n                    => reset_reset_n                     --                     reset.reset_n
        );
		  
		  
end architecture arch_albouquet_lab1;