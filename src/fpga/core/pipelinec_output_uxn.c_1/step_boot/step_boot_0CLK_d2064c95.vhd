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
-- Submodules: 22
entity step_boot_0CLK_d2064c95 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 return_output : out boot_step_result_t);
end step_boot_0CLK_d2064c95;
architecture arch of step_boot_0CLK_d2064c95 is
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
-- BIN_OP_EQ[uxn_c_l31_c6_55d1]
signal BIN_OP_EQ_uxn_c_l31_c6_55d1_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_55d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_feb3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_388a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output : unsigned(0 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_45d1]
signal rom_address_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_45d1]
signal is_finished_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_45d1]
signal rom_byte_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(7 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_45d1]
signal ram_address_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l32_c14_7105]
signal read_rom_byte_uxn_c_l32_c14_7105_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_7105_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_7105_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l33_c3_d58b[uxn_c_l33_c3_d58b]
signal printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_c_l36_c11_204d]
signal BIN_OP_EQ_uxn_c_l36_c11_204d_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_204d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l36_c11_204d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_8541]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output : unsigned(0 downto 0);

-- rom_address_MUX[uxn_c_l36_c7_388a]
signal rom_address_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l36_c7_388a_return_output : unsigned(15 downto 0);

-- is_finished_MUX[uxn_c_l36_c7_388a]
signal is_finished_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l36_c7_388a_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l36_c7_388a]
signal rom_byte_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l36_c7_388a_return_output : unsigned(7 downto 0);

-- ram_address_MUX[uxn_c_l36_c7_388a]
signal ram_address_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l36_c7_388a_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l37_c14_dcd2]
signal read_rom_byte_uxn_c_l37_c14_dcd2_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l37_c14_dcd2_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l37_c14_dcd2_return_output : unsigned(7 downto 0);

-- printf_uxn_c_l38_c3_8c28[uxn_c_l38_c3_8c28]
signal printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg0 : unsigned(31 downto 0);
signal printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg1 : unsigned(31 downto 0);

-- BIN_OP_PLUS[uxn_c_l39_c3_ee27]
signal BIN_OP_PLUS_uxn_c_l39_c3_ee27_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_ee27_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l40_c3_b63c]
signal BIN_OP_PLUS_uxn_c_l40_c3_b63c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_b63c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l41_c17_95c6]
signal BIN_OP_GT_uxn_c_l41_c17_95c6_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_95c6_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l41_c17_95c6_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l45_c2_4371]
signal BIN_OP_PLUS_uxn_c_l45_c2_4371_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_4371_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l31_c6_55d1
BIN_OP_EQ_uxn_c_l31_c6_55d1 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_55d1_left,
BIN_OP_EQ_uxn_c_l31_c6_55d1_right,
BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output);

-- rom_address_MUX_uxn_c_l31_c2_45d1
rom_address_MUX_uxn_c_l31_c2_45d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_45d1_cond,
rom_address_MUX_uxn_c_l31_c2_45d1_iftrue,
rom_address_MUX_uxn_c_l31_c2_45d1_iffalse,
rom_address_MUX_uxn_c_l31_c2_45d1_return_output);

-- is_finished_MUX_uxn_c_l31_c2_45d1
is_finished_MUX_uxn_c_l31_c2_45d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_45d1_cond,
is_finished_MUX_uxn_c_l31_c2_45d1_iftrue,
is_finished_MUX_uxn_c_l31_c2_45d1_iffalse,
is_finished_MUX_uxn_c_l31_c2_45d1_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_45d1
rom_byte_MUX_uxn_c_l31_c2_45d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_45d1_cond,
rom_byte_MUX_uxn_c_l31_c2_45d1_iftrue,
rom_byte_MUX_uxn_c_l31_c2_45d1_iffalse,
rom_byte_MUX_uxn_c_l31_c2_45d1_return_output);

-- ram_address_MUX_uxn_c_l31_c2_45d1
ram_address_MUX_uxn_c_l31_c2_45d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_45d1_cond,
ram_address_MUX_uxn_c_l31_c2_45d1_iftrue,
ram_address_MUX_uxn_c_l31_c2_45d1_iffalse,
ram_address_MUX_uxn_c_l31_c2_45d1_return_output);

-- read_rom_byte_uxn_c_l32_c14_7105
read_rom_byte_uxn_c_l32_c14_7105 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_7105_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_7105_read_address,
read_rom_byte_uxn_c_l32_c14_7105_return_output);

-- printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b
printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b : entity work.printf_uxn_c_l33_c3_d58b_0CLK_de264c78 port map (
printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_CLOCK_ENABLE,
printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_arg0);

-- BIN_OP_EQ_uxn_c_l36_c11_204d
BIN_OP_EQ_uxn_c_l36_c11_204d : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l36_c11_204d_left,
BIN_OP_EQ_uxn_c_l36_c11_204d_right,
BIN_OP_EQ_uxn_c_l36_c11_204d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output);

-- rom_address_MUX_uxn_c_l36_c7_388a
rom_address_MUX_uxn_c_l36_c7_388a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l36_c7_388a_cond,
rom_address_MUX_uxn_c_l36_c7_388a_iftrue,
rom_address_MUX_uxn_c_l36_c7_388a_iffalse,
rom_address_MUX_uxn_c_l36_c7_388a_return_output);

-- is_finished_MUX_uxn_c_l36_c7_388a
is_finished_MUX_uxn_c_l36_c7_388a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l36_c7_388a_cond,
is_finished_MUX_uxn_c_l36_c7_388a_iftrue,
is_finished_MUX_uxn_c_l36_c7_388a_iffalse,
is_finished_MUX_uxn_c_l36_c7_388a_return_output);

-- rom_byte_MUX_uxn_c_l36_c7_388a
rom_byte_MUX_uxn_c_l36_c7_388a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l36_c7_388a_cond,
rom_byte_MUX_uxn_c_l36_c7_388a_iftrue,
rom_byte_MUX_uxn_c_l36_c7_388a_iffalse,
rom_byte_MUX_uxn_c_l36_c7_388a_return_output);

-- ram_address_MUX_uxn_c_l36_c7_388a
ram_address_MUX_uxn_c_l36_c7_388a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l36_c7_388a_cond,
ram_address_MUX_uxn_c_l36_c7_388a_iftrue,
ram_address_MUX_uxn_c_l36_c7_388a_iffalse,
ram_address_MUX_uxn_c_l36_c7_388a_return_output);

-- read_rom_byte_uxn_c_l37_c14_dcd2
read_rom_byte_uxn_c_l37_c14_dcd2 : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l37_c14_dcd2_CLOCK_ENABLE,
read_rom_byte_uxn_c_l37_c14_dcd2_read_address,
read_rom_byte_uxn_c_l37_c14_dcd2_return_output);

-- printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28
printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28 : entity work.printf_uxn_c_l38_c3_8c28_0CLK_de264c78 port map (
printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_CLOCK_ENABLE,
printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg0,
printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg1);

-- BIN_OP_PLUS_uxn_c_l39_c3_ee27
BIN_OP_PLUS_uxn_c_l39_c3_ee27 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l39_c3_ee27_left,
BIN_OP_PLUS_uxn_c_l39_c3_ee27_right,
BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output);

-- BIN_OP_PLUS_uxn_c_l40_c3_b63c
BIN_OP_PLUS_uxn_c_l40_c3_b63c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l40_c3_b63c_left,
BIN_OP_PLUS_uxn_c_l40_c3_b63c_right,
BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output);

-- BIN_OP_GT_uxn_c_l41_c17_95c6
BIN_OP_GT_uxn_c_l41_c17_95c6 : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l41_c17_95c6_left,
BIN_OP_GT_uxn_c_l41_c17_95c6_right,
BIN_OP_GT_uxn_c_l41_c17_95c6_return_output);

-- BIN_OP_PLUS_uxn_c_l45_c2_4371
BIN_OP_PLUS_uxn_c_l45_c2_4371 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l45_c2_4371_left,
BIN_OP_PLUS_uxn_c_l45_c2_4371_right,
BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output);



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
 BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output,
 rom_address_MUX_uxn_c_l31_c2_45d1_return_output,
 is_finished_MUX_uxn_c_l31_c2_45d1_return_output,
 rom_byte_MUX_uxn_c_l31_c2_45d1_return_output,
 ram_address_MUX_uxn_c_l31_c2_45d1_return_output,
 read_rom_byte_uxn_c_l32_c14_7105_return_output,
 BIN_OP_EQ_uxn_c_l36_c11_204d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output,
 rom_address_MUX_uxn_c_l36_c7_388a_return_output,
 is_finished_MUX_uxn_c_l36_c7_388a_return_output,
 rom_byte_MUX_uxn_c_l36_c7_388a_return_output,
 ram_address_MUX_uxn_c_l36_c7_388a_return_output,
 read_rom_byte_uxn_c_l37_c14_dcd2_return_output,
 BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output,
 BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output,
 BIN_OP_GT_uxn_c_l41_c17_95c6_return_output,
 BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_388a_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_388a_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_388a_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_45d1_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_45d1_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_388a_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_45d1_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_45d1_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_7105_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_7105_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_7105_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iffalse : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l39_c3_b8a6 : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_uxn_c_l37_c3_0fba : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_388a_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l40_c3_09ff : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_388a_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l36_c7_388a_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_dcd2_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_dcd2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l37_c14_dcd2_return_output : unsigned(7 downto 0);
 variable VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l45_c2_7054 : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_2a9a_return_output : boot_step_result_t;
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
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_right := to_unsigned(1, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_45d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_right := to_unsigned(511, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l36_c7_388a_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_45d1_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l36_c7_388a_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_left := rom_address;
     VAR_printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_arg0 := resize(rom_address, 32);
     VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg0 := resize(rom_address, 32);
     VAR_read_rom_byte_uxn_c_l32_c14_7105_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l37_c14_dcd2_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_45d1_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l36_c7_388a_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l36_c7_388a_iffalse := rom_byte;
     -- BIN_OP_EQ[uxn_c_l36_c11_204d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l36_c11_204d_left <= VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_left;
     BIN_OP_EQ_uxn_c_l36_c11_204d_right <= VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output := BIN_OP_EQ_uxn_c_l36_c11_204d_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_55d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_55d1_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_left;
     BIN_OP_EQ_uxn_c_l31_c6_55d1_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output := BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;

     -- BIN_OP_PLUS[uxn_c_l39_c3_ee27] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l39_c3_ee27_left <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_left;
     BIN_OP_PLUS_uxn_c_l39_c3_ee27_right <= VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output := BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output;

     -- BIN_OP_PLUS[uxn_c_l45_c2_4371] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l45_c2_4371_left <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_left;
     BIN_OP_PLUS_uxn_c_l45_c2_4371_right <= VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output := BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output;

     -- BIN_OP_PLUS[uxn_c_l40_c3_b63c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l40_c3_b63c_left <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_left;
     BIN_OP_PLUS_uxn_c_l40_c3_b63c_right <= VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output := BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_45d1_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_45d1_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_45d1_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_55d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output;
     VAR_is_finished_MUX_uxn_c_l36_c7_388a_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output;
     VAR_ram_address_MUX_uxn_c_l36_c7_388a_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output;
     VAR_rom_address_MUX_uxn_c_l36_c7_388a_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output;
     VAR_rom_byte_MUX_uxn_c_l36_c7_388a_cond := VAR_BIN_OP_EQ_uxn_c_l36_c11_204d_return_output;
     VAR_rom_address_uxn_c_l39_c3_b8a6 := resize(VAR_BIN_OP_PLUS_uxn_c_l39_c3_ee27_return_output, 16);
     VAR_ram_address_uxn_c_l40_c3_09ff := resize(VAR_BIN_OP_PLUS_uxn_c_l40_c3_b63c_return_output, 16);
     VAR_boot_phase_uxn_c_l45_c2_7054 := resize(VAR_BIN_OP_PLUS_uxn_c_l45_c2_4371_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l45_c2_7054;
     VAR_ram_address_MUX_uxn_c_l36_c7_388a_iftrue := VAR_ram_address_uxn_c_l40_c3_09ff;
     VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_left := VAR_rom_address_uxn_c_l39_c3_b8a6;
     VAR_rom_address_MUX_uxn_c_l36_c7_388a_iftrue := VAR_rom_address_uxn_c_l39_c3_b8a6;
     -- BIN_OP_GT[uxn_c_l41_c17_95c6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l41_c17_95c6_left <= VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_left;
     BIN_OP_GT_uxn_c_l41_c17_95c6_right <= VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_return_output := BIN_OP_GT_uxn_c_l41_c17_95c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_feb3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l36_c7_388a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output;

     -- rom_address_MUX[uxn_c_l36_c7_388a] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l36_c7_388a_cond <= VAR_rom_address_MUX_uxn_c_l36_c7_388a_cond;
     rom_address_MUX_uxn_c_l36_c7_388a_iftrue <= VAR_rom_address_MUX_uxn_c_l36_c7_388a_iftrue;
     rom_address_MUX_uxn_c_l36_c7_388a_iffalse <= VAR_rom_address_MUX_uxn_c_l36_c7_388a_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l36_c7_388a_return_output := rom_address_MUX_uxn_c_l36_c7_388a_return_output;

     -- ram_address_MUX[uxn_c_l36_c7_388a] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l36_c7_388a_cond <= VAR_ram_address_MUX_uxn_c_l36_c7_388a_cond;
     ram_address_MUX_uxn_c_l36_c7_388a_iftrue <= VAR_ram_address_MUX_uxn_c_l36_c7_388a_iftrue;
     ram_address_MUX_uxn_c_l36_c7_388a_iffalse <= VAR_ram_address_MUX_uxn_c_l36_c7_388a_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l36_c7_388a_return_output := ram_address_MUX_uxn_c_l36_c7_388a_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l36_c7_388a_iftrue := VAR_BIN_OP_GT_uxn_c_l41_c17_95c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l36_c7_388a_return_output;
     VAR_printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_7105_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_feb3_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_45d1_iffalse := VAR_ram_address_MUX_uxn_c_l36_c7_388a_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_45d1_iffalse := VAR_rom_address_MUX_uxn_c_l36_c7_388a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l36_c1_8541] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output;

     -- printf_uxn_c_l33_c3_d58b[uxn_c_l33_c3_d58b] LATENCY=0
     -- Clock enable
     printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_CLOCK_ENABLE <= VAR_printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_arg0 <= VAR_printf_uxn_c_l33_c3_d58b_uxn_c_l33_c3_d58b_arg0;
     -- Outputs

     -- read_rom_byte[uxn_c_l32_c14_7105] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_7105_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_7105_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_7105_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_7105_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_7105_return_output := read_rom_byte_uxn_c_l32_c14_7105_return_output;

     -- is_finished_MUX[uxn_c_l36_c7_388a] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l36_c7_388a_cond <= VAR_is_finished_MUX_uxn_c_l36_c7_388a_cond;
     is_finished_MUX_uxn_c_l36_c7_388a_iftrue <= VAR_is_finished_MUX_uxn_c_l36_c7_388a_iftrue;
     is_finished_MUX_uxn_c_l36_c7_388a_iffalse <= VAR_is_finished_MUX_uxn_c_l36_c7_388a_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l36_c7_388a_return_output := is_finished_MUX_uxn_c_l36_c7_388a_return_output;

     -- ram_address_MUX[uxn_c_l31_c2_45d1] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_45d1_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_45d1_cond;
     ram_address_MUX_uxn_c_l31_c2_45d1_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_45d1_iftrue;
     ram_address_MUX_uxn_c_l31_c2_45d1_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_45d1_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_45d1_return_output := ram_address_MUX_uxn_c_l31_c2_45d1_return_output;

     -- rom_address_MUX[uxn_c_l31_c2_45d1] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_45d1_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_45d1_cond;
     rom_address_MUX_uxn_c_l31_c2_45d1_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_45d1_iftrue;
     rom_address_MUX_uxn_c_l31_c2_45d1_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_45d1_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_45d1_return_output := rom_address_MUX_uxn_c_l31_c2_45d1_return_output;

     -- Submodule level 3
     VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output;
     VAR_read_rom_byte_uxn_c_l37_c14_dcd2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l36_c1_8541_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_45d1_iffalse := VAR_is_finished_MUX_uxn_c_l36_c7_388a_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_45d1_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_7105_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_45d1_return_output;
     -- is_finished_MUX[uxn_c_l31_c2_45d1] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_45d1_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_45d1_cond;
     is_finished_MUX_uxn_c_l31_c2_45d1_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_45d1_iftrue;
     is_finished_MUX_uxn_c_l31_c2_45d1_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_45d1_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_45d1_return_output := is_finished_MUX_uxn_c_l31_c2_45d1_return_output;

     -- read_rom_byte[uxn_c_l37_c14_dcd2] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l37_c14_dcd2_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l37_c14_dcd2_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l37_c14_dcd2_read_address <= VAR_read_rom_byte_uxn_c_l37_c14_dcd2_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l37_c14_dcd2_return_output := read_rom_byte_uxn_c_l37_c14_dcd2_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_45d1_return_output;
     VAR_rom_byte_uxn_c_l37_c3_0fba := VAR_read_rom_byte_uxn_c_l37_c14_dcd2_return_output;
     VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg1 := resize(VAR_rom_byte_uxn_c_l37_c3_0fba, 32);
     VAR_rom_byte_MUX_uxn_c_l36_c7_388a_iftrue := VAR_rom_byte_uxn_c_l37_c3_0fba;
     -- rom_byte_MUX[uxn_c_l36_c7_388a] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l36_c7_388a_cond <= VAR_rom_byte_MUX_uxn_c_l36_c7_388a_cond;
     rom_byte_MUX_uxn_c_l36_c7_388a_iftrue <= VAR_rom_byte_MUX_uxn_c_l36_c7_388a_iftrue;
     rom_byte_MUX_uxn_c_l36_c7_388a_iffalse <= VAR_rom_byte_MUX_uxn_c_l36_c7_388a_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l36_c7_388a_return_output := rom_byte_MUX_uxn_c_l36_c7_388a_return_output;

     -- printf_uxn_c_l38_c3_8c28[uxn_c_l38_c3_8c28] LATENCY=0
     -- Clock enable
     printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_CLOCK_ENABLE <= VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg0 <= VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg0;
     printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg1 <= VAR_printf_uxn_c_l38_c3_8c28_uxn_c_l38_c3_8c28_arg1;
     -- Outputs

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_iffalse := VAR_rom_byte_MUX_uxn_c_l36_c7_388a_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_45d1] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_45d1_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_cond;
     rom_byte_MUX_uxn_c_l31_c2_45d1_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_45d1_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_return_output := rom_byte_MUX_uxn_c_l31_c2_45d1_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l47_c9_2a9a] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_2a9a_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_45d1_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_45d1_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_45d1_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l47_c9_2a9a_return_output;
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
