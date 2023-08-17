-- Timing params:
--   Fixed?: False
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 2
entity peek2_stack_w_0CLK_7bf2eff3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 address : in unsigned(7 downto 0);
 return_output : out unsigned(15 downto 0));
end peek2_stack_w_0CLK_7bf2eff3;
architecture arch of peek2_stack_w_0CLK_7bf2eff3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- BIN_OP_PLUS[uxn_stack_h_l174_c46_4e8b]
signal BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output : unsigned(8 downto 0);

-- stack_w_ram_update[uxn_stack_h_l174_c9_52fd]
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b
BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_left,
BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_right,
BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output);

-- stack_w_ram_update_uxn_stack_h_l174_c9_52fd
stack_w_ram_update_uxn_stack_h_l174_c9_52fd : entity work.stack_w_ram_update_0CLK_c464aa95 port map (
clk,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_CLOCK_ENABLE,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address0,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_value,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_enable,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read0_enable,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address1,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read1_enable,
stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 address,
 -- All submodule outputs
 BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output,
 stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_address : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read1_enable : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output : unsigned(8 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output : unsigned(15 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_enable := to_unsigned(0, 1);
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read1_enable := to_unsigned(1, 1);
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read0_enable := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_right := to_unsigned(1, 1);
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_value := resize(to_unsigned(0, 1), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_address := address;

     -- Submodule level 0
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_left := VAR_address;
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address0 := VAR_address;
     -- BIN_OP_PLUS[uxn_stack_h_l174_c46_4e8b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_left;
     BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output := BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output;

     -- Submodule level 1
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address1 := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l174_c46_4e8b_return_output, 8);
     -- stack_w_ram_update[uxn_stack_h_l174_c9_52fd] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address0 <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address0;
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_value <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_value;
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_enable <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_write0_enable;
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read0_enable <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read0_enable;
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address1 <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_address1;
     stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read1_enable <= VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output := stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output;

     -- Submodule level 2
     VAR_return_output := VAR_stack_w_ram_update_uxn_stack_h_l174_c9_52fd_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
