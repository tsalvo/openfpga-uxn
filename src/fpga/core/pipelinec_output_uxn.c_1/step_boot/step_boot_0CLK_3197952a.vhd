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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 20
entity step_boot_0CLK_3197952a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out boot_step_result_t);
end step_boot_0CLK_3197952a;
architecture arch of step_boot_0CLK_3197952a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal ram_address : unsigned(15 downto 0) := to_unsigned(254, 16);
signal rom_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal rom_byte : unsigned(7 downto 0) := to_unsigned(0, 8);
signal boot_phase : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_finished : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_ram_address : unsigned(15 downto 0);
signal REG_COMB_rom_address : unsigned(15 downto 0);
signal REG_COMB_rom_byte : unsigned(7 downto 0);
signal REG_COMB_boot_phase : unsigned(0 downto 0);
signal REG_COMB_is_finished : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_c_l31_c6_e189]
signal BIN_OP_EQ_uxn_c_l31_c6_e189_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_e189_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_e189_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_0e98]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l35_c7_bfef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_63db]
signal ram_address_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_63db_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_63db]
signal is_finished_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_63db_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_63db]
signal rom_byte_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_63db_return_output : unsigned(7 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_63db]
signal rom_address_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_63db_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l32_c14_9931]
signal read_rom_byte_uxn_c_l32_c14_9931_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_9931_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_9931_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l35_c11_ceb3]
signal BIN_OP_EQ_uxn_c_l35_c11_ceb3_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l35_c11_ceb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_3e94]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output : unsigned(0 downto 0);

-- ram_address_MUX[uxn_c_l35_c7_bfef]
signal ram_address_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l35_c7_bfef]
signal is_finished_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l35_c7_bfef]
signal rom_byte_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(7 downto 0);

-- rom_address_MUX[uxn_c_l35_c7_bfef]
signal rom_address_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l36_c14_c637]
signal read_rom_byte_uxn_c_l36_c14_c637_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l36_c14_c637_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l36_c14_c637_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l37_c3_99e7]
signal BIN_OP_PLUS_uxn_c_l37_c3_99e7_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l37_c3_99e7_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l38_c3_7d53]
signal BIN_OP_PLUS_uxn_c_l38_c3_7d53_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c3_7d53_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l39_c17_f417]
signal BIN_OP_GT_uxn_c_l39_c17_f417_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l39_c17_f417_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l39_c17_f417_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l43_c2_78f6]
signal BIN_OP_PLUS_uxn_c_l43_c2_78f6_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l43_c2_78f6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output : unsigned(1 downto 0);

function CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return boot_step_result_t is
 
  variable base : boot_step_result_t; 
  variable return_output : boot_step_result_t;
begin
      base.is_valid_byte := ref_toks_0;
      base.is_finished := ref_toks_1;
      base.rom_byte := ref_toks_2;
      base.ram_address := ref_toks_3;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_c_l31_c6_e189
BIN_OP_EQ_uxn_c_l31_c6_e189 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_e189_left,
BIN_OP_EQ_uxn_c_l31_c6_e189_right,
BIN_OP_EQ_uxn_c_l31_c6_e189_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output);

-- ram_address_MUX_uxn_c_l31_c2_63db
ram_address_MUX_uxn_c_l31_c2_63db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_63db_cond,
ram_address_MUX_uxn_c_l31_c2_63db_iftrue,
ram_address_MUX_uxn_c_l31_c2_63db_iffalse,
ram_address_MUX_uxn_c_l31_c2_63db_return_output);

-- is_finished_MUX_uxn_c_l31_c2_63db
is_finished_MUX_uxn_c_l31_c2_63db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_63db_cond,
is_finished_MUX_uxn_c_l31_c2_63db_iftrue,
is_finished_MUX_uxn_c_l31_c2_63db_iffalse,
is_finished_MUX_uxn_c_l31_c2_63db_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_63db
rom_byte_MUX_uxn_c_l31_c2_63db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_63db_cond,
rom_byte_MUX_uxn_c_l31_c2_63db_iftrue,
rom_byte_MUX_uxn_c_l31_c2_63db_iffalse,
rom_byte_MUX_uxn_c_l31_c2_63db_return_output);

-- rom_address_MUX_uxn_c_l31_c2_63db
rom_address_MUX_uxn_c_l31_c2_63db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_63db_cond,
rom_address_MUX_uxn_c_l31_c2_63db_iftrue,
rom_address_MUX_uxn_c_l31_c2_63db_iffalse,
rom_address_MUX_uxn_c_l31_c2_63db_return_output);

-- read_rom_byte_uxn_c_l32_c14_9931
read_rom_byte_uxn_c_l32_c14_9931 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_9931_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_9931_read_address,
read_rom_byte_uxn_c_l32_c14_9931_return_output);

-- BIN_OP_EQ_uxn_c_l35_c11_ceb3
BIN_OP_EQ_uxn_c_l35_c11_ceb3 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l35_c11_ceb3_left,
BIN_OP_EQ_uxn_c_l35_c11_ceb3_right,
BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output);

-- ram_address_MUX_uxn_c_l35_c7_bfef
ram_address_MUX_uxn_c_l35_c7_bfef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l35_c7_bfef_cond,
ram_address_MUX_uxn_c_l35_c7_bfef_iftrue,
ram_address_MUX_uxn_c_l35_c7_bfef_iffalse,
ram_address_MUX_uxn_c_l35_c7_bfef_return_output);

-- is_finished_MUX_uxn_c_l35_c7_bfef
is_finished_MUX_uxn_c_l35_c7_bfef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l35_c7_bfef_cond,
is_finished_MUX_uxn_c_l35_c7_bfef_iftrue,
is_finished_MUX_uxn_c_l35_c7_bfef_iffalse,
is_finished_MUX_uxn_c_l35_c7_bfef_return_output);

-- rom_byte_MUX_uxn_c_l35_c7_bfef
rom_byte_MUX_uxn_c_l35_c7_bfef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l35_c7_bfef_cond,
rom_byte_MUX_uxn_c_l35_c7_bfef_iftrue,
rom_byte_MUX_uxn_c_l35_c7_bfef_iffalse,
rom_byte_MUX_uxn_c_l35_c7_bfef_return_output);

-- rom_address_MUX_uxn_c_l35_c7_bfef
rom_address_MUX_uxn_c_l35_c7_bfef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l35_c7_bfef_cond,
rom_address_MUX_uxn_c_l35_c7_bfef_iftrue,
rom_address_MUX_uxn_c_l35_c7_bfef_iffalse,
rom_address_MUX_uxn_c_l35_c7_bfef_return_output);

-- read_rom_byte_uxn_c_l36_c14_c637
read_rom_byte_uxn_c_l36_c14_c637 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l36_c14_c637_CLOCK_ENABLE,
read_rom_byte_uxn_c_l36_c14_c637_read_address,
read_rom_byte_uxn_c_l36_c14_c637_return_output);

-- BIN_OP_PLUS_uxn_c_l37_c3_99e7
BIN_OP_PLUS_uxn_c_l37_c3_99e7 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l37_c3_99e7_left,
BIN_OP_PLUS_uxn_c_l37_c3_99e7_right,
BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output);

-- BIN_OP_PLUS_uxn_c_l38_c3_7d53
BIN_OP_PLUS_uxn_c_l38_c3_7d53 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l38_c3_7d53_left,
BIN_OP_PLUS_uxn_c_l38_c3_7d53_right,
BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output);

-- BIN_OP_GT_uxn_c_l39_c17_f417
BIN_OP_GT_uxn_c_l39_c17_f417 : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l39_c17_f417_left,
BIN_OP_GT_uxn_c_l39_c17_f417_right,
BIN_OP_GT_uxn_c_l39_c17_f417_return_output);

-- BIN_OP_PLUS_uxn_c_l43_c2_78f6
BIN_OP_PLUS_uxn_c_l43_c2_78f6 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l43_c2_78f6_left,
BIN_OP_PLUS_uxn_c_l43_c2_78f6_right,
BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Registers
 ram_address,
 rom_address,
 rom_byte,
 boot_phase,
 is_finished,
 -- All submodule outputs
 BIN_OP_EQ_uxn_c_l31_c6_e189_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output,
 ram_address_MUX_uxn_c_l31_c2_63db_return_output,
 is_finished_MUX_uxn_c_l31_c2_63db_return_output,
 rom_byte_MUX_uxn_c_l31_c2_63db_return_output,
 rom_address_MUX_uxn_c_l31_c2_63db_return_output,
 read_rom_byte_uxn_c_l32_c14_9931_return_output,
 BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output,
 ram_address_MUX_uxn_c_l35_c7_bfef_return_output,
 is_finished_MUX_uxn_c_l35_c7_bfef_return_output,
 rom_byte_MUX_uxn_c_l35_c7_bfef_return_output,
 rom_address_MUX_uxn_c_l35_c7_bfef_return_output,
 read_rom_byte_uxn_c_l36_c14_c637_return_output,
 BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output,
 BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output,
 BIN_OP_GT_uxn_c_l39_c17_f417_return_output,
 BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_63db_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_63db_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_63db_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_63db_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_63db_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_bfef_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_63db_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_63db_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_9931_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_9931_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_9931_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iffalse : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l38_c3_f6ef : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_bfef_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l37_c3_ea6e : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_bfef_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_bfef_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l36_c14_c637_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l36_c14_c637_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l36_c14_c637_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l39_c17_f417_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l39_c17_f417_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l39_c17_f417_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l43_c2_c996 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l45_c9_cfd9_return_output : boot_step_result_t;
 -- State registers comb logic variables
variable REG_VAR_ram_address : unsigned(15 downto 0);
variable REG_VAR_rom_address : unsigned(15 downto 0);
variable REG_VAR_rom_byte : unsigned(7 downto 0);
variable REG_VAR_boot_phase : unsigned(0 downto 0);
variable REG_VAR_is_finished : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_ram_address := ram_address;
  REG_VAR_rom_address := rom_address;
  REG_VAR_rom_byte := rom_byte;
  REG_VAR_boot_phase := boot_phase;
  REG_VAR_is_finished := is_finished;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l39_c17_f417_right := to_unsigned(511, 9);
     VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_right := to_unsigned(1, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_63db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l35_c7_bfef_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_63db_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l35_c7_bfef_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_left := rom_address;
     VAR_read_rom_byte_uxn_c_l32_c14_9931_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l36_c14_c637_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_63db_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l35_c7_bfef_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l38_c3_7d53] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l38_c3_7d53_left <= VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_left;
     BIN_OP_PLUS_uxn_c_l38_c3_7d53_right <= VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output := BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output;

     -- BIN_OP_PLUS[uxn_c_l37_c3_99e7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l37_c3_99e7_left <= VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_left;
     BIN_OP_PLUS_uxn_c_l37_c3_99e7_right <= VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output := BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output;

     -- BIN_OP_PLUS[uxn_c_l43_c2_78f6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l43_c2_78f6_left <= VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_left;
     BIN_OP_PLUS_uxn_c_l43_c2_78f6_right <= VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output := BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_e189] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_e189_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_left;
     BIN_OP_EQ_uxn_c_l31_c6_e189_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output := BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;

     -- BIN_OP_EQ[uxn_c_l35_c11_ceb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l35_c11_ceb3_left <= VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_left;
     BIN_OP_EQ_uxn_c_l35_c11_ceb3_right <= VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output := BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_63db_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_63db_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_63db_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_63db_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_e189_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output;
     VAR_is_finished_MUX_uxn_c_l35_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output;
     VAR_ram_address_MUX_uxn_c_l35_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output;
     VAR_rom_address_MUX_uxn_c_l35_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output;
     VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_ceb3_return_output;
     VAR_rom_address_uxn_c_l37_c3_ea6e := resize(VAR_BIN_OP_PLUS_uxn_c_l37_c3_99e7_return_output, 16);
     VAR_ram_address_uxn_c_l38_c3_f6ef := resize(VAR_BIN_OP_PLUS_uxn_c_l38_c3_7d53_return_output, 16);
     VAR_boot_phase_uxn_c_l43_c2_c996 := resize(VAR_BIN_OP_PLUS_uxn_c_l43_c2_78f6_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l43_c2_c996;
     VAR_ram_address_MUX_uxn_c_l35_c7_bfef_iftrue := VAR_ram_address_uxn_c_l38_c3_f6ef;
     VAR_BIN_OP_GT_uxn_c_l39_c17_f417_left := VAR_rom_address_uxn_c_l37_c3_ea6e;
     VAR_rom_address_MUX_uxn_c_l35_c7_bfef_iftrue := VAR_rom_address_uxn_c_l37_c3_ea6e;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l35_c7_bfef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output;

     -- BIN_OP_GT[uxn_c_l39_c17_f417] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l39_c17_f417_left <= VAR_BIN_OP_GT_uxn_c_l39_c17_f417_left;
     BIN_OP_GT_uxn_c_l39_c17_f417_right <= VAR_BIN_OP_GT_uxn_c_l39_c17_f417_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l39_c17_f417_return_output := BIN_OP_GT_uxn_c_l39_c17_f417_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_0e98] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output;

     -- rom_address_MUX[uxn_c_l35_c7_bfef] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l35_c7_bfef_cond <= VAR_rom_address_MUX_uxn_c_l35_c7_bfef_cond;
     rom_address_MUX_uxn_c_l35_c7_bfef_iftrue <= VAR_rom_address_MUX_uxn_c_l35_c7_bfef_iftrue;
     rom_address_MUX_uxn_c_l35_c7_bfef_iffalse <= VAR_rom_address_MUX_uxn_c_l35_c7_bfef_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l35_c7_bfef_return_output := rom_address_MUX_uxn_c_l35_c7_bfef_return_output;

     -- ram_address_MUX[uxn_c_l35_c7_bfef] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l35_c7_bfef_cond <= VAR_ram_address_MUX_uxn_c_l35_c7_bfef_cond;
     ram_address_MUX_uxn_c_l35_c7_bfef_iftrue <= VAR_ram_address_MUX_uxn_c_l35_c7_bfef_iftrue;
     ram_address_MUX_uxn_c_l35_c7_bfef_iffalse <= VAR_ram_address_MUX_uxn_c_l35_c7_bfef_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l35_c7_bfef_return_output := ram_address_MUX_uxn_c_l35_c7_bfef_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l35_c7_bfef_iftrue := VAR_BIN_OP_GT_uxn_c_l39_c17_f417_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_bfef_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_9931_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_0e98_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_63db_iffalse := VAR_ram_address_MUX_uxn_c_l35_c7_bfef_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_63db_iffalse := VAR_rom_address_MUX_uxn_c_l35_c7_bfef_return_output;
     -- rom_address_MUX[uxn_c_l31_c2_63db] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_63db_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_63db_cond;
     rom_address_MUX_uxn_c_l31_c2_63db_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_63db_iftrue;
     rom_address_MUX_uxn_c_l31_c2_63db_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_63db_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_63db_return_output := rom_address_MUX_uxn_c_l31_c2_63db_return_output;

     -- is_finished_MUX[uxn_c_l35_c7_bfef] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l35_c7_bfef_cond <= VAR_is_finished_MUX_uxn_c_l35_c7_bfef_cond;
     is_finished_MUX_uxn_c_l35_c7_bfef_iftrue <= VAR_is_finished_MUX_uxn_c_l35_c7_bfef_iftrue;
     is_finished_MUX_uxn_c_l35_c7_bfef_iffalse <= VAR_is_finished_MUX_uxn_c_l35_c7_bfef_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l35_c7_bfef_return_output := is_finished_MUX_uxn_c_l35_c7_bfef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_3e94] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output;

     -- read_rom_byte[uxn_c_l32_c14_9931] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_9931_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_9931_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_9931_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_9931_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_9931_return_output := read_rom_byte_uxn_c_l32_c14_9931_return_output;

     -- ram_address_MUX[uxn_c_l31_c2_63db] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_63db_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_63db_cond;
     ram_address_MUX_uxn_c_l31_c2_63db_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_63db_iftrue;
     ram_address_MUX_uxn_c_l31_c2_63db_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_63db_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_63db_return_output := ram_address_MUX_uxn_c_l31_c2_63db_return_output;

     -- Submodule level 3
     VAR_read_rom_byte_uxn_c_l36_c14_c637_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_3e94_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_63db_iffalse := VAR_is_finished_MUX_uxn_c_l35_c7_bfef_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_63db_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_63db_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_9931_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_63db_return_output;
     -- read_rom_byte[uxn_c_l36_c14_c637] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l36_c14_c637_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l36_c14_c637_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l36_c14_c637_read_address <= VAR_read_rom_byte_uxn_c_l36_c14_c637_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l36_c14_c637_return_output := read_rom_byte_uxn_c_l36_c14_c637_return_output;

     -- is_finished_MUX[uxn_c_l31_c2_63db] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_63db_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_63db_cond;
     is_finished_MUX_uxn_c_l31_c2_63db_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_63db_iftrue;
     is_finished_MUX_uxn_c_l31_c2_63db_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_63db_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_63db_return_output := is_finished_MUX_uxn_c_l31_c2_63db_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_63db_return_output;
     VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_iftrue := VAR_read_rom_byte_uxn_c_l36_c14_c637_return_output;
     -- rom_byte_MUX[uxn_c_l35_c7_bfef] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l35_c7_bfef_cond <= VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_cond;
     rom_byte_MUX_uxn_c_l35_c7_bfef_iftrue <= VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_iftrue;
     rom_byte_MUX_uxn_c_l35_c7_bfef_iffalse <= VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_return_output := rom_byte_MUX_uxn_c_l35_c7_bfef_return_output;

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_63db_iffalse := VAR_rom_byte_MUX_uxn_c_l35_c7_bfef_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_63db] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_63db_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_63db_cond;
     rom_byte_MUX_uxn_c_l31_c2_63db_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_63db_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_63db_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_63db_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_63db_return_output := rom_byte_MUX_uxn_c_l31_c2_63db_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_63db_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l45_c9_cfd9] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l45_c9_cfd9_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_63db_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_63db_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_63db_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l45_c9_cfd9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_ram_address <= REG_VAR_ram_address;
REG_COMB_rom_address <= REG_VAR_rom_address;
REG_COMB_rom_byte <= REG_VAR_rom_byte;
REG_COMB_boot_phase <= REG_VAR_boot_phase;
REG_COMB_is_finished <= REG_VAR_is_finished;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     ram_address <= REG_COMB_ram_address;
     rom_address <= REG_COMB_rom_address;
     rom_byte <= REG_COMB_rom_byte;
     boot_phase <= REG_COMB_boot_phase;
     is_finished <= REG_COMB_is_finished;
 end if;
 end if;
end process;

end arch;
