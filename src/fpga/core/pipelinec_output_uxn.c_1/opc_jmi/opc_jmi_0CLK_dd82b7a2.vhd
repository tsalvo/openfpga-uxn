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
-- Submodules: 4
entity opc_jmi_0CLK_dd82b7a2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jmi_0CLK_dd82b7a2;
architecture arch of opc_jmi_0CLK_dd82b7a2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function
-- Each function instance gets signals
-- pc_get[uxn_opcodes_h_l32_c19_24af]
signal pc_get_uxn_opcodes_h_l32_c19_24af_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_get_uxn_opcodes_h_l32_c19_24af_return_output : unsigned(15 downto 0);

-- peek2_ram[uxn_opcodes_h_l32_c9_68c2]
signal peek2_ram_uxn_opcodes_h_l32_c9_68c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_h_l32_c9_68c2_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l32_c9_8454]
signal BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output : unsigned(16 downto 0);

-- pc_add[uxn_opcodes_h_l32_c2_3584]
signal pc_add_uxn_opcodes_h_l32_c2_3584_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_uxn_opcodes_h_l32_c2_3584_adjustment : unsigned(15 downto 0);


begin

-- SUBMODULE INSTANCES 
-- pc_get_uxn_opcodes_h_l32_c19_24af
pc_get_uxn_opcodes_h_l32_c19_24af : entity work.pc_get_0CLK_a756e59f port map (
clk,
pc_get_uxn_opcodes_h_l32_c19_24af_CLOCK_ENABLE,
pc_get_uxn_opcodes_h_l32_c19_24af_return_output);

-- peek2_ram_uxn_opcodes_h_l32_c9_68c2
peek2_ram_uxn_opcodes_h_l32_c9_68c2 : entity work.peek2_ram_0CLK_ad162598 port map (
clk,
peek2_ram_uxn_opcodes_h_l32_c9_68c2_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_h_l32_c9_68c2_address,
peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454
BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_left,
BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_right,
BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output);

-- pc_add_uxn_opcodes_h_l32_c2_3584
pc_add_uxn_opcodes_h_l32_c2_3584 : entity work.pc_add_0CLK_8573165f port map (
clk,
pc_add_uxn_opcodes_h_l32_c2_3584_CLOCK_ENABLE,
pc_add_uxn_opcodes_h_l32_c2_3584_adjustment);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- All submodule outputs
 pc_get_uxn_opcodes_h_l32_c19_24af_return_output,
 peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l32_c2_3584_adjustment : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_left : unsigned(15 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l32_c19_24af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_get_uxn_opcodes_h_l32_c19_24af_return_output : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output : unsigned(16 downto 0);
 variable VAR_pc_add_uxn_opcodes_h_l32_c2_3584_CLOCK_ENABLE : unsigned(0 downto 0);
begin
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_return_output := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_pc_add_uxn_opcodes_h_l32_c2_3584_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_pc_get_uxn_opcodes_h_l32_c19_24af_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     -- pc_get[uxn_opcodes_h_l32_c19_24af] LATENCY=0
     -- Clock enable
     pc_get_uxn_opcodes_h_l32_c19_24af_CLOCK_ENABLE <= VAR_pc_get_uxn_opcodes_h_l32_c19_24af_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_pc_get_uxn_opcodes_h_l32_c19_24af_return_output := pc_get_uxn_opcodes_h_l32_c19_24af_return_output;

     -- Submodule level 1
     VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_address := VAR_pc_get_uxn_opcodes_h_l32_c19_24af_return_output;
     -- peek2_ram[uxn_opcodes_h_l32_c9_68c2] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_h_l32_c9_68c2_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_h_l32_c9_68c2_address <= VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output := peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_left := VAR_peek2_ram_uxn_opcodes_h_l32_c9_68c2_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l32_c9_8454] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_left;
     BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output := BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output;

     -- Submodule level 3
     VAR_pc_add_uxn_opcodes_h_l32_c2_3584_adjustment := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l32_c9_8454_return_output, 16);
     -- pc_add[uxn_opcodes_h_l32_c2_3584] LATENCY=0
     -- Clock enable
     pc_add_uxn_opcodes_h_l32_c2_3584_CLOCK_ENABLE <= VAR_pc_add_uxn_opcodes_h_l32_c2_3584_CLOCK_ENABLE;
     -- Inputs
     pc_add_uxn_opcodes_h_l32_c2_3584_adjustment <= VAR_pc_add_uxn_opcodes_h_l32_c2_3584_adjustment;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

end process;

end arch;
