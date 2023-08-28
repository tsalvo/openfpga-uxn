-- Timing params:
--   Fixed?: True
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
-- Submodules: 10
entity step_boot_0CLK_b8381d00 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out unsigned(0 downto 0));
end step_boot_0CLK_b8381d00;
architecture arch of step_boot_0CLK_b8381d00 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal ram_address : unsigned(15 downto 0) := to_unsigned(256, 16);
signal rom_index : unsigned(7 downto 0) := to_unsigned(0, 8);
signal rom_byte : unsigned(7 downto 0) := to_unsigned(0, 8);
signal dummy_read_complete : unsigned(0 downto 0) := to_unsigned(0, 1);
signal read_complete : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_rom_index : unsigned(7 downto 0);
signal REG_COMB_rom_byte : unsigned(7 downto 0);
signal REG_COMB_dummy_read_complete : unsigned(0 downto 0);
signal REG_COMB_read_complete : unsigned(0 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- read_rom_byte[uxn_c_l24_c13_7923]
signal read_rom_byte_uxn_c_l24_c13_7923_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l24_c13_7923_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l26_c1_860c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l26_c2_48b2]
signal ram_address_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(15 downto 0);

-- dummy_read_complete_MUX[uxn_c_l26_c2_48b2]
signal dummy_read_complete_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
signal dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(0 downto 0);
signal dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(0 downto 0);
signal dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_c_l26_c2_48b2]
signal result_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(0 downto 0);

-- rom_index_MUX[uxn_c_l26_c2_48b2]
signal rom_index_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
signal rom_index_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(7 downto 0);
signal rom_index_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(7 downto 0);
signal rom_index_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(7 downto 0);

-- poke_ram[uxn_c_l27_c3_3b11]
signal poke_ram_uxn_c_l27_c3_3b11_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_c_l27_c3_3b11_address : unsigned(15 downto 0);
signal poke_ram_uxn_c_l27_c3_3b11_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l28_c3_ee4c]
signal BIN_OP_PLUS_uxn_c_l28_c3_ee4c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_c_l28_c3_ee4c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_c_l29_c3_8412]
signal BIN_OP_PLUS_uxn_c_l29_c3_8412_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l29_c3_8412_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l30_c12_2a15]
signal BIN_OP_GT_uxn_c_l30_c12_2a15_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_c_l30_c12_2a15_right : unsigned(6 downto 0);
signal BIN_OP_GT_uxn_c_l30_c12_2a15_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- read_rom_byte_uxn_c_l24_c13_7923
read_rom_byte_uxn_c_l24_c13_7923 : entity work.read_rom_byte_0CLK_23f04728 port map (
clk,
read_rom_byte_uxn_c_l24_c13_7923_CLOCK_ENABLE,
read_rom_byte_uxn_c_l24_c13_7923_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c
TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output);

-- ram_address_MUX_uxn_c_l26_c2_48b2
ram_address_MUX_uxn_c_l26_c2_48b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l26_c2_48b2_cond,
ram_address_MUX_uxn_c_l26_c2_48b2_iftrue,
ram_address_MUX_uxn_c_l26_c2_48b2_iffalse,
ram_address_MUX_uxn_c_l26_c2_48b2_return_output);

-- dummy_read_complete_MUX_uxn_c_l26_c2_48b2
dummy_read_complete_MUX_uxn_c_l26_c2_48b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
dummy_read_complete_MUX_uxn_c_l26_c2_48b2_cond,
dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iftrue,
dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iffalse,
dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output);

-- result_MUX_uxn_c_l26_c2_48b2
result_MUX_uxn_c_l26_c2_48b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_c_l26_c2_48b2_cond,
result_MUX_uxn_c_l26_c2_48b2_iftrue,
result_MUX_uxn_c_l26_c2_48b2_iffalse,
result_MUX_uxn_c_l26_c2_48b2_return_output);

-- rom_index_MUX_uxn_c_l26_c2_48b2
rom_index_MUX_uxn_c_l26_c2_48b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_index_MUX_uxn_c_l26_c2_48b2_cond,
rom_index_MUX_uxn_c_l26_c2_48b2_iftrue,
rom_index_MUX_uxn_c_l26_c2_48b2_iffalse,
rom_index_MUX_uxn_c_l26_c2_48b2_return_output);

-- poke_ram_uxn_c_l27_c3_3b11
poke_ram_uxn_c_l27_c3_3b11 : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_c_l27_c3_3b11_CLOCK_ENABLE,
poke_ram_uxn_c_l27_c3_3b11_address,
poke_ram_uxn_c_l27_c3_3b11_value);

-- BIN_OP_PLUS_uxn_c_l28_c3_ee4c
BIN_OP_PLUS_uxn_c_l28_c3_ee4c : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l28_c3_ee4c_left,
BIN_OP_PLUS_uxn_c_l28_c3_ee4c_right,
BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output);

-- BIN_OP_PLUS_uxn_c_l29_c3_8412
BIN_OP_PLUS_uxn_c_l29_c3_8412 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l29_c3_8412_left,
BIN_OP_PLUS_uxn_c_l29_c3_8412_right,
BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output);

-- BIN_OP_GT_uxn_c_l30_c12_2a15
BIN_OP_GT_uxn_c_l30_c12_2a15 : entity work.BIN_OP_GT_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l30_c12_2a15_left,
BIN_OP_GT_uxn_c_l30_c12_2a15_right,
BIN_OP_GT_uxn_c_l30_c12_2a15_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 ram_address,
 rom_index,
 rom_byte,
 dummy_read_complete,
 read_complete,
 result,
 -- All submodule outputs
 read_rom_byte_uxn_c_l24_c13_7923_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output,
 ram_address_MUX_uxn_c_l26_c2_48b2_return_output,
 dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output,
 result_MUX_uxn_c_l26_c2_48b2_return_output,
 rom_index_MUX_uxn_c_l26_c2_48b2_return_output,
 BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output,
 BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output,
 BIN_OP_GT_uxn_c_l30_c12_2a15_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l24_c13_7923_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l24_c13_7923_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iffalse : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l29_c3_92a2 : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(0 downto 0);
 variable VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(0 downto 0);
 variable VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(0 downto 0);
 variable VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_rom_index_MUX_uxn_c_l26_c2_48b2_iftrue : unsigned(7 downto 0);
 variable VAR_rom_index_uxn_c_l28_c3_7458 : unsigned(7 downto 0);
 variable VAR_rom_index_MUX_uxn_c_l26_c2_48b2_iffalse : unsigned(7 downto 0);
 variable VAR_rom_index_MUX_uxn_c_l26_c2_48b2_return_output : unsigned(7 downto 0);
 variable VAR_rom_index_MUX_uxn_c_l26_c2_48b2_cond : unsigned(0 downto 0);
 variable VAR_poke_ram_uxn_c_l27_c3_3b11_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_c_l27_c3_3b11_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_c_l27_c3_3b11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_rom_index : unsigned(7 downto 0);
variable REG_VAR_rom_byte : unsigned(7 downto 0);
variable REG_VAR_dummy_read_complete : unsigned(0 downto 0);
variable REG_VAR_read_complete : unsigned(0 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_ram_address := ram_address;
  REG_VAR_rom_index := rom_index;
  REG_VAR_rom_byte := rom_byte;
  REG_VAR_dummy_read_complete := dummy_read_complete;
  REG_VAR_read_complete := read_complete;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_right := to_unsigned(1, 1);
     VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_right := to_unsigned(127, 7);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iftrue := VAR_CLOCK_ENABLE;
     VAR_read_rom_byte_uxn_c_l24_c13_7923_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_cond := dummy_read_complete;
     VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_cond := dummy_read_complete;
     VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iftrue := dummy_read_complete;
     VAR_ram_address_MUX_uxn_c_l26_c2_48b2_cond := dummy_read_complete;
     VAR_result_MUX_uxn_c_l26_c2_48b2_cond := dummy_read_complete;
     VAR_rom_index_MUX_uxn_c_l26_c2_48b2_cond := dummy_read_complete;
     VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_left := ram_address;
     VAR_poke_ram_uxn_c_l27_c3_3b11_address := ram_address;
     VAR_ram_address_MUX_uxn_c_l26_c2_48b2_iffalse := ram_address;
     REG_VAR_read_complete := read_complete;
     VAR_result_MUX_uxn_c_l26_c2_48b2_iffalse := result;
     VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_left := rom_index;
     VAR_rom_index_MUX_uxn_c_l26_c2_48b2_iffalse := rom_index;
     -- read_rom_byte[uxn_c_l24_c13_7923] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l24_c13_7923_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l24_c13_7923_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_read_rom_byte_uxn_c_l24_c13_7923_return_output := read_rom_byte_uxn_c_l24_c13_7923_return_output;

     -- BIN_OP_PLUS[uxn_c_l28_c3_ee4c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l28_c3_ee4c_left <= VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_left;
     BIN_OP_PLUS_uxn_c_l28_c3_ee4c_right <= VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output := BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output;

     -- dummy_read_complete_MUX[uxn_c_l26_c2_48b2] LATENCY=0
     -- Inputs
     dummy_read_complete_MUX_uxn_c_l26_c2_48b2_cond <= VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_cond;
     dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iftrue <= VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iftrue;
     dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iffalse <= VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_iffalse;
     -- Outputs
     VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output := dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output;

     -- BIN_OP_PLUS[uxn_c_l29_c3_8412] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l29_c3_8412_left <= VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_left;
     BIN_OP_PLUS_uxn_c_l29_c3_8412_right <= VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output := BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l26_c1_860c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output;

     -- Submodule level 1
     VAR_rom_index_uxn_c_l28_c3_7458 := resize(VAR_BIN_OP_PLUS_uxn_c_l28_c3_ee4c_return_output, 8);
     VAR_ram_address_uxn_c_l29_c3_92a2 := resize(VAR_BIN_OP_PLUS_uxn_c_l29_c3_8412_return_output, 16);
     VAR_poke_ram_uxn_c_l27_c3_3b11_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l26_c1_860c_return_output;
     REG_VAR_dummy_read_complete := VAR_dummy_read_complete_MUX_uxn_c_l26_c2_48b2_return_output;
     VAR_poke_ram_uxn_c_l27_c3_3b11_value := VAR_read_rom_byte_uxn_c_l24_c13_7923_return_output;
     REG_VAR_rom_byte := VAR_read_rom_byte_uxn_c_l24_c13_7923_return_output;
     VAR_ram_address_MUX_uxn_c_l26_c2_48b2_iftrue := VAR_ram_address_uxn_c_l29_c3_92a2;
     VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_left := VAR_rom_index_uxn_c_l28_c3_7458;
     VAR_rom_index_MUX_uxn_c_l26_c2_48b2_iftrue := VAR_rom_index_uxn_c_l28_c3_7458;
     -- rom_index_MUX[uxn_c_l26_c2_48b2] LATENCY=0
     -- Inputs
     rom_index_MUX_uxn_c_l26_c2_48b2_cond <= VAR_rom_index_MUX_uxn_c_l26_c2_48b2_cond;
     rom_index_MUX_uxn_c_l26_c2_48b2_iftrue <= VAR_rom_index_MUX_uxn_c_l26_c2_48b2_iftrue;
     rom_index_MUX_uxn_c_l26_c2_48b2_iffalse <= VAR_rom_index_MUX_uxn_c_l26_c2_48b2_iffalse;
     -- Outputs
     VAR_rom_index_MUX_uxn_c_l26_c2_48b2_return_output := rom_index_MUX_uxn_c_l26_c2_48b2_return_output;

     -- BIN_OP_GT[uxn_c_l30_c12_2a15] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l30_c12_2a15_left <= VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_left;
     BIN_OP_GT_uxn_c_l30_c12_2a15_right <= VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_return_output := BIN_OP_GT_uxn_c_l30_c12_2a15_return_output;

     -- poke_ram[uxn_c_l27_c3_3b11] LATENCY=0
     -- Clock enable
     poke_ram_uxn_c_l27_c3_3b11_CLOCK_ENABLE <= VAR_poke_ram_uxn_c_l27_c3_3b11_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_c_l27_c3_3b11_address <= VAR_poke_ram_uxn_c_l27_c3_3b11_address;
     poke_ram_uxn_c_l27_c3_3b11_value <= VAR_poke_ram_uxn_c_l27_c3_3b11_value;
     -- Outputs

     -- ram_address_MUX[uxn_c_l26_c2_48b2] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l26_c2_48b2_cond <= VAR_ram_address_MUX_uxn_c_l26_c2_48b2_cond;
     ram_address_MUX_uxn_c_l26_c2_48b2_iftrue <= VAR_ram_address_MUX_uxn_c_l26_c2_48b2_iftrue;
     ram_address_MUX_uxn_c_l26_c2_48b2_iffalse <= VAR_ram_address_MUX_uxn_c_l26_c2_48b2_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l26_c2_48b2_return_output := ram_address_MUX_uxn_c_l26_c2_48b2_return_output;

     -- Submodule level 2
     VAR_result_MUX_uxn_c_l26_c2_48b2_iftrue := VAR_BIN_OP_GT_uxn_c_l30_c12_2a15_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l26_c2_48b2_return_output;
     REG_VAR_rom_index := VAR_rom_index_MUX_uxn_c_l26_c2_48b2_return_output;
     -- result_MUX[uxn_c_l26_c2_48b2] LATENCY=0
     -- Inputs
     result_MUX_uxn_c_l26_c2_48b2_cond <= VAR_result_MUX_uxn_c_l26_c2_48b2_cond;
     result_MUX_uxn_c_l26_c2_48b2_iftrue <= VAR_result_MUX_uxn_c_l26_c2_48b2_iftrue;
     result_MUX_uxn_c_l26_c2_48b2_iffalse <= VAR_result_MUX_uxn_c_l26_c2_48b2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_c_l26_c2_48b2_return_output := result_MUX_uxn_c_l26_c2_48b2_return_output;

     -- Submodule level 3
     REG_VAR_result := VAR_result_MUX_uxn_c_l26_c2_48b2_return_output;
     VAR_return_output := VAR_result_MUX_uxn_c_l26_c2_48b2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_ram_address <= REG_VAR_ram_address;
REG_COMB_rom_index <= REG_VAR_rom_index;
REG_COMB_rom_byte <= REG_VAR_rom_byte;
REG_COMB_dummy_read_complete <= REG_VAR_dummy_read_complete;
REG_COMB_read_complete <= REG_VAR_read_complete;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     ram_address <= REG_COMB_ram_address;
     rom_index <= REG_COMB_rom_index;
     rom_byte <= REG_COMB_rom_byte;
     dummy_read_complete <= REG_COMB_dummy_read_complete;
     read_complete <= REG_COMB_read_complete;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
