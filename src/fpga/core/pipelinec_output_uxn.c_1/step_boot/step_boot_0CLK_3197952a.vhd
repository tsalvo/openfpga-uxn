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
-- BIN_OP_EQ[uxn_c_l31_c6_8f72]
signal BIN_OP_EQ_uxn_c_l31_c6_8f72_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_8f72_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_d55f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_c_l35_c7_ece7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(0 downto 0);

-- is_finished_MUX[uxn_c_l31_c2_7a12]
signal is_finished_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l31_c2_7a12]
signal rom_byte_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(7 downto 0);

-- ram_address_MUX[uxn_c_l31_c2_7a12]
signal ram_address_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l31_c2_7a12]
signal rom_address_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l32_c14_149e]
signal read_rom_byte_uxn_c_l32_c14_149e_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l32_c14_149e_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l32_c14_149e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_c_l35_c11_209a]
signal BIN_OP_EQ_uxn_c_l35_c11_209a_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l35_c11_209a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_c_l35_c11_209a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_1054]
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output : unsigned(0 downto 0);

-- is_finished_MUX[uxn_c_l35_c7_ece7]
signal is_finished_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(0 downto 0);
signal is_finished_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(0 downto 0);

-- rom_byte_MUX[uxn_c_l35_c7_ece7]
signal rom_byte_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
signal rom_byte_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(7 downto 0);
signal rom_byte_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(7 downto 0);

-- ram_address_MUX[uxn_c_l35_c7_ece7]
signal ram_address_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
signal ram_address_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(15 downto 0);
signal ram_address_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(15 downto 0);

-- rom_address_MUX[uxn_c_l35_c7_ece7]
signal rom_address_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
signal rom_address_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(15 downto 0);
signal rom_address_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(15 downto 0);

-- read_rom_byte[uxn_c_l36_c14_484b]
signal read_rom_byte_uxn_c_l36_c14_484b_CLOCK_ENABLE : unsigned(0 downto 0);
signal read_rom_byte_uxn_c_l36_c14_484b_read_address : unsigned(15 downto 0);
signal read_rom_byte_uxn_c_l36_c14_484b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_c_l37_c3_fbe9]
signal BIN_OP_PLUS_uxn_c_l37_c3_fbe9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l37_c3_fbe9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_c_l38_c3_452b]
signal BIN_OP_PLUS_uxn_c_l38_c3_452b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c3_452b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output : unsigned(16 downto 0);

-- BIN_OP_GT[uxn_c_l39_c17_9a3f]
signal BIN_OP_GT_uxn_c_l39_c17_9a3f_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_c_l39_c17_9a3f_right : unsigned(8 downto 0);
signal BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_c_l43_c2_0547]
signal BIN_OP_PLUS_uxn_c_l43_c2_0547_left : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l43_c2_0547_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output : unsigned(1 downto 0);

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
-- BIN_OP_EQ_uxn_c_l31_c6_8f72
BIN_OP_EQ_uxn_c_l31_c6_8f72 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l31_c6_8f72_left,
BIN_OP_EQ_uxn_c_l31_c6_8f72_right,
BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output);

-- is_finished_MUX_uxn_c_l31_c2_7a12
is_finished_MUX_uxn_c_l31_c2_7a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l31_c2_7a12_cond,
is_finished_MUX_uxn_c_l31_c2_7a12_iftrue,
is_finished_MUX_uxn_c_l31_c2_7a12_iffalse,
is_finished_MUX_uxn_c_l31_c2_7a12_return_output);

-- rom_byte_MUX_uxn_c_l31_c2_7a12
rom_byte_MUX_uxn_c_l31_c2_7a12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l31_c2_7a12_cond,
rom_byte_MUX_uxn_c_l31_c2_7a12_iftrue,
rom_byte_MUX_uxn_c_l31_c2_7a12_iffalse,
rom_byte_MUX_uxn_c_l31_c2_7a12_return_output);

-- ram_address_MUX_uxn_c_l31_c2_7a12
ram_address_MUX_uxn_c_l31_c2_7a12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l31_c2_7a12_cond,
ram_address_MUX_uxn_c_l31_c2_7a12_iftrue,
ram_address_MUX_uxn_c_l31_c2_7a12_iffalse,
ram_address_MUX_uxn_c_l31_c2_7a12_return_output);

-- rom_address_MUX_uxn_c_l31_c2_7a12
rom_address_MUX_uxn_c_l31_c2_7a12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l31_c2_7a12_cond,
rom_address_MUX_uxn_c_l31_c2_7a12_iftrue,
rom_address_MUX_uxn_c_l31_c2_7a12_iffalse,
rom_address_MUX_uxn_c_l31_c2_7a12_return_output);

-- read_rom_byte_uxn_c_l32_c14_149e
read_rom_byte_uxn_c_l32_c14_149e : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l32_c14_149e_CLOCK_ENABLE,
read_rom_byte_uxn_c_l32_c14_149e_read_address,
read_rom_byte_uxn_c_l32_c14_149e_return_output);

-- BIN_OP_EQ_uxn_c_l35_c11_209a
BIN_OP_EQ_uxn_c_l35_c11_209a : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l35_c11_209a_left,
BIN_OP_EQ_uxn_c_l35_c11_209a_right,
BIN_OP_EQ_uxn_c_l35_c11_209a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output);

-- is_finished_MUX_uxn_c_l35_c7_ece7
is_finished_MUX_uxn_c_l35_c7_ece7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_finished_MUX_uxn_c_l35_c7_ece7_cond,
is_finished_MUX_uxn_c_l35_c7_ece7_iftrue,
is_finished_MUX_uxn_c_l35_c7_ece7_iffalse,
is_finished_MUX_uxn_c_l35_c7_ece7_return_output);

-- rom_byte_MUX_uxn_c_l35_c7_ece7
rom_byte_MUX_uxn_c_l35_c7_ece7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
rom_byte_MUX_uxn_c_l35_c7_ece7_cond,
rom_byte_MUX_uxn_c_l35_c7_ece7_iftrue,
rom_byte_MUX_uxn_c_l35_c7_ece7_iffalse,
rom_byte_MUX_uxn_c_l35_c7_ece7_return_output);

-- ram_address_MUX_uxn_c_l35_c7_ece7
ram_address_MUX_uxn_c_l35_c7_ece7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
ram_address_MUX_uxn_c_l35_c7_ece7_cond,
ram_address_MUX_uxn_c_l35_c7_ece7_iftrue,
ram_address_MUX_uxn_c_l35_c7_ece7_iffalse,
ram_address_MUX_uxn_c_l35_c7_ece7_return_output);

-- rom_address_MUX_uxn_c_l35_c7_ece7
rom_address_MUX_uxn_c_l35_c7_ece7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
rom_address_MUX_uxn_c_l35_c7_ece7_cond,
rom_address_MUX_uxn_c_l35_c7_ece7_iftrue,
rom_address_MUX_uxn_c_l35_c7_ece7_iffalse,
rom_address_MUX_uxn_c_l35_c7_ece7_return_output);

-- read_rom_byte_uxn_c_l36_c14_484b
read_rom_byte_uxn_c_l36_c14_484b : entity work.read_rom_byte_0CLK_380ecc95 port map (
clk,
read_rom_byte_uxn_c_l36_c14_484b_CLOCK_ENABLE,
read_rom_byte_uxn_c_l36_c14_484b_read_address,
read_rom_byte_uxn_c_l36_c14_484b_return_output);

-- BIN_OP_PLUS_uxn_c_l37_c3_fbe9
BIN_OP_PLUS_uxn_c_l37_c3_fbe9 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l37_c3_fbe9_left,
BIN_OP_PLUS_uxn_c_l37_c3_fbe9_right,
BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output);

-- BIN_OP_PLUS_uxn_c_l38_c3_452b
BIN_OP_PLUS_uxn_c_l38_c3_452b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l38_c3_452b_left,
BIN_OP_PLUS_uxn_c_l38_c3_452b_right,
BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output);

-- BIN_OP_GT_uxn_c_l39_c17_9a3f
BIN_OP_GT_uxn_c_l39_c17_9a3f : entity work.BIN_OP_GT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_c_l39_c17_9a3f_left,
BIN_OP_GT_uxn_c_l39_c17_9a3f_right,
BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output);

-- BIN_OP_PLUS_uxn_c_l43_c2_0547
BIN_OP_PLUS_uxn_c_l43_c2_0547 : entity work.BIN_OP_PLUS_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_c_l43_c2_0547_left,
BIN_OP_PLUS_uxn_c_l43_c2_0547_right,
BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output);



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
 BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output,
 is_finished_MUX_uxn_c_l31_c2_7a12_return_output,
 rom_byte_MUX_uxn_c_l31_c2_7a12_return_output,
 ram_address_MUX_uxn_c_l31_c2_7a12_return_output,
 rom_address_MUX_uxn_c_l31_c2_7a12_return_output,
 read_rom_byte_uxn_c_l32_c14_149e_return_output,
 BIN_OP_EQ_uxn_c_l35_c11_209a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output,
 is_finished_MUX_uxn_c_l35_c7_ece7_return_output,
 rom_byte_MUX_uxn_c_l35_c7_ece7_return_output,
 ram_address_MUX_uxn_c_l35_c7_ece7_return_output,
 rom_address_MUX_uxn_c_l35_c7_ece7_return_output,
 read_rom_byte_uxn_c_l36_c14_484b_return_output,
 BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output,
 BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output,
 BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output,
 BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : boot_step_result_t;
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_7a12_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_7a12_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_ece7_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_7a12_return_output : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l31_c2_7a12_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_149e_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_149e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l32_c14_149e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(0 downto 0);
 variable VAR_is_finished_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(7 downto 0);
 variable VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(15 downto 0);
 variable VAR_ram_address_uxn_c_l38_c3_351e : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(15 downto 0);
 variable VAR_ram_address_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_ece7_iftrue : unsigned(15 downto 0);
 variable VAR_rom_address_uxn_c_l37_c3_0c41 : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_ece7_iffalse : unsigned(15 downto 0);
 variable VAR_rom_address_MUX_uxn_c_l35_c7_ece7_cond : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l36_c14_484b_read_address : unsigned(15 downto 0);
 variable VAR_read_rom_byte_uxn_c_l36_c14_484b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_read_rom_byte_uxn_c_l36_c14_484b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output : unsigned(0 downto 0);
 variable VAR_boot_result : boot_step_result_t;
 variable VAR_boot_phase_uxn_c_l43_c2_22dc : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l45_c9_62c9_return_output : boot_step_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_right := to_unsigned(511, 9);
     VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_right := to_unsigned(1, 1);
     VAR_is_finished_MUX_uxn_c_l31_c2_7a12_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_left := boot_phase;
     VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_left := boot_phase;
     VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_left := boot_phase;
     VAR_is_finished_MUX_uxn_c_l35_c7_ece7_iffalse := is_finished;
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_left := ram_address;
     VAR_ram_address_MUX_uxn_c_l31_c2_7a12_iftrue := ram_address;
     VAR_ram_address_MUX_uxn_c_l35_c7_ece7_iffalse := ram_address;
     VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_left := rom_address;
     VAR_read_rom_byte_uxn_c_l32_c14_149e_read_address := rom_address;
     VAR_read_rom_byte_uxn_c_l36_c14_484b_read_address := rom_address;
     VAR_rom_address_MUX_uxn_c_l31_c2_7a12_iftrue := rom_address;
     VAR_rom_address_MUX_uxn_c_l35_c7_ece7_iffalse := rom_address;
     VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_iffalse := rom_byte;
     -- BIN_OP_PLUS[uxn_c_l38_c3_452b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l38_c3_452b_left <= VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_left;
     BIN_OP_PLUS_uxn_c_l38_c3_452b_right <= VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output := BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output;

     -- BIN_OP_EQ[uxn_c_l35_c11_209a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l35_c11_209a_left <= VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_left;
     BIN_OP_EQ_uxn_c_l35_c11_209a_right <= VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output := BIN_OP_EQ_uxn_c_l35_c11_209a_return_output;

     -- BIN_OP_PLUS[uxn_c_l43_c2_0547] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l43_c2_0547_left <= VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_left;
     BIN_OP_PLUS_uxn_c_l43_c2_0547_right <= VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output := BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output;

     -- BIN_OP_PLUS[uxn_c_l37_c3_fbe9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_c_l37_c3_fbe9_left <= VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_left;
     BIN_OP_PLUS_uxn_c_l37_c3_fbe9_right <= VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output := BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output;

     -- BIN_OP_EQ[uxn_c_l31_c6_8f72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l31_c6_8f72_left <= VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_left;
     BIN_OP_EQ_uxn_c_l31_c6_8f72_right <= VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output := BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_7a12_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_7a12_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_7a12_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_cond := VAR_BIN_OP_EQ_uxn_c_l31_c6_8f72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output;
     VAR_is_finished_MUX_uxn_c_l35_c7_ece7_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output;
     VAR_ram_address_MUX_uxn_c_l35_c7_ece7_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output;
     VAR_rom_address_MUX_uxn_c_l35_c7_ece7_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output;
     VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_cond := VAR_BIN_OP_EQ_uxn_c_l35_c11_209a_return_output;
     VAR_rom_address_uxn_c_l37_c3_0c41 := resize(VAR_BIN_OP_PLUS_uxn_c_l37_c3_fbe9_return_output, 16);
     VAR_ram_address_uxn_c_l38_c3_351e := resize(VAR_BIN_OP_PLUS_uxn_c_l38_c3_452b_return_output, 16);
     VAR_boot_phase_uxn_c_l43_c2_22dc := resize(VAR_BIN_OP_PLUS_uxn_c_l43_c2_0547_return_output, 1);
     REG_VAR_boot_phase := VAR_boot_phase_uxn_c_l43_c2_22dc;
     VAR_ram_address_MUX_uxn_c_l35_c7_ece7_iftrue := VAR_ram_address_uxn_c_l38_c3_351e;
     VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_left := VAR_rom_address_uxn_c_l37_c3_0c41;
     VAR_rom_address_MUX_uxn_c_l35_c7_ece7_iftrue := VAR_rom_address_uxn_c_l37_c3_0c41;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_c_l35_c7_ece7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output;

     -- rom_address_MUX[uxn_c_l35_c7_ece7] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l35_c7_ece7_cond <= VAR_rom_address_MUX_uxn_c_l35_c7_ece7_cond;
     rom_address_MUX_uxn_c_l35_c7_ece7_iftrue <= VAR_rom_address_MUX_uxn_c_l35_c7_ece7_iftrue;
     rom_address_MUX_uxn_c_l35_c7_ece7_iffalse <= VAR_rom_address_MUX_uxn_c_l35_c7_ece7_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l35_c7_ece7_return_output := rom_address_MUX_uxn_c_l35_c7_ece7_return_output;

     -- BIN_OP_GT[uxn_c_l39_c17_9a3f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_c_l39_c17_9a3f_left <= VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_left;
     BIN_OP_GT_uxn_c_l39_c17_9a3f_right <= VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output := BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output;

     -- ram_address_MUX[uxn_c_l35_c7_ece7] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l35_c7_ece7_cond <= VAR_ram_address_MUX_uxn_c_l35_c7_ece7_cond;
     ram_address_MUX_uxn_c_l35_c7_ece7_iftrue <= VAR_ram_address_MUX_uxn_c_l35_c7_ece7_iftrue;
     ram_address_MUX_uxn_c_l35_c7_ece7_iffalse <= VAR_ram_address_MUX_uxn_c_l35_c7_ece7_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l35_c7_ece7_return_output := ram_address_MUX_uxn_c_l35_c7_ece7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l31_c1_d55f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output;

     -- Submodule level 2
     VAR_is_finished_MUX_uxn_c_l35_c7_ece7_iftrue := VAR_BIN_OP_GT_uxn_c_l39_c17_9a3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_c_l35_c7_ece7_return_output;
     VAR_read_rom_byte_uxn_c_l32_c14_149e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l31_c1_d55f_return_output;
     VAR_ram_address_MUX_uxn_c_l31_c2_7a12_iffalse := VAR_ram_address_MUX_uxn_c_l35_c7_ece7_return_output;
     VAR_rom_address_MUX_uxn_c_l31_c2_7a12_iffalse := VAR_rom_address_MUX_uxn_c_l35_c7_ece7_return_output;
     -- ram_address_MUX[uxn_c_l31_c2_7a12] LATENCY=0
     -- Inputs
     ram_address_MUX_uxn_c_l31_c2_7a12_cond <= VAR_ram_address_MUX_uxn_c_l31_c2_7a12_cond;
     ram_address_MUX_uxn_c_l31_c2_7a12_iftrue <= VAR_ram_address_MUX_uxn_c_l31_c2_7a12_iftrue;
     ram_address_MUX_uxn_c_l31_c2_7a12_iffalse <= VAR_ram_address_MUX_uxn_c_l31_c2_7a12_iffalse;
     -- Outputs
     VAR_ram_address_MUX_uxn_c_l31_c2_7a12_return_output := ram_address_MUX_uxn_c_l31_c2_7a12_return_output;

     -- rom_address_MUX[uxn_c_l31_c2_7a12] LATENCY=0
     -- Inputs
     rom_address_MUX_uxn_c_l31_c2_7a12_cond <= VAR_rom_address_MUX_uxn_c_l31_c2_7a12_cond;
     rom_address_MUX_uxn_c_l31_c2_7a12_iftrue <= VAR_rom_address_MUX_uxn_c_l31_c2_7a12_iftrue;
     rom_address_MUX_uxn_c_l31_c2_7a12_iffalse <= VAR_rom_address_MUX_uxn_c_l31_c2_7a12_iffalse;
     -- Outputs
     VAR_rom_address_MUX_uxn_c_l31_c2_7a12_return_output := rom_address_MUX_uxn_c_l31_c2_7a12_return_output;

     -- is_finished_MUX[uxn_c_l35_c7_ece7] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l35_c7_ece7_cond <= VAR_is_finished_MUX_uxn_c_l35_c7_ece7_cond;
     is_finished_MUX_uxn_c_l35_c7_ece7_iftrue <= VAR_is_finished_MUX_uxn_c_l35_c7_ece7_iftrue;
     is_finished_MUX_uxn_c_l35_c7_ece7_iffalse <= VAR_is_finished_MUX_uxn_c_l35_c7_ece7_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l35_c7_ece7_return_output := is_finished_MUX_uxn_c_l35_c7_ece7_return_output;

     -- read_rom_byte[uxn_c_l32_c14_149e] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l32_c14_149e_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l32_c14_149e_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l32_c14_149e_read_address <= VAR_read_rom_byte_uxn_c_l32_c14_149e_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l32_c14_149e_return_output := read_rom_byte_uxn_c_l32_c14_149e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_c_l35_c1_1054] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output;

     -- Submodule level 3
     VAR_read_rom_byte_uxn_c_l36_c14_484b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_c_l35_c1_1054_return_output;
     VAR_is_finished_MUX_uxn_c_l31_c2_7a12_iffalse := VAR_is_finished_MUX_uxn_c_l35_c7_ece7_return_output;
     REG_VAR_ram_address := VAR_ram_address_MUX_uxn_c_l31_c2_7a12_return_output;
     VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_iftrue := VAR_read_rom_byte_uxn_c_l32_c14_149e_return_output;
     REG_VAR_rom_address := VAR_rom_address_MUX_uxn_c_l31_c2_7a12_return_output;
     -- read_rom_byte[uxn_c_l36_c14_484b] LATENCY=0
     -- Clock enable
     read_rom_byte_uxn_c_l36_c14_484b_CLOCK_ENABLE <= VAR_read_rom_byte_uxn_c_l36_c14_484b_CLOCK_ENABLE;
     -- Inputs
     read_rom_byte_uxn_c_l36_c14_484b_read_address <= VAR_read_rom_byte_uxn_c_l36_c14_484b_read_address;
     -- Outputs
     VAR_read_rom_byte_uxn_c_l36_c14_484b_return_output := read_rom_byte_uxn_c_l36_c14_484b_return_output;

     -- is_finished_MUX[uxn_c_l31_c2_7a12] LATENCY=0
     -- Inputs
     is_finished_MUX_uxn_c_l31_c2_7a12_cond <= VAR_is_finished_MUX_uxn_c_l31_c2_7a12_cond;
     is_finished_MUX_uxn_c_l31_c2_7a12_iftrue <= VAR_is_finished_MUX_uxn_c_l31_c2_7a12_iftrue;
     is_finished_MUX_uxn_c_l31_c2_7a12_iffalse <= VAR_is_finished_MUX_uxn_c_l31_c2_7a12_iffalse;
     -- Outputs
     VAR_is_finished_MUX_uxn_c_l31_c2_7a12_return_output := is_finished_MUX_uxn_c_l31_c2_7a12_return_output;

     -- Submodule level 4
     REG_VAR_is_finished := VAR_is_finished_MUX_uxn_c_l31_c2_7a12_return_output;
     VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_iftrue := VAR_read_rom_byte_uxn_c_l36_c14_484b_return_output;
     -- rom_byte_MUX[uxn_c_l35_c7_ece7] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l35_c7_ece7_cond <= VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_cond;
     rom_byte_MUX_uxn_c_l35_c7_ece7_iftrue <= VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_iftrue;
     rom_byte_MUX_uxn_c_l35_c7_ece7_iffalse <= VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_return_output := rom_byte_MUX_uxn_c_l35_c7_ece7_return_output;

     -- Submodule level 5
     VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_iffalse := VAR_rom_byte_MUX_uxn_c_l35_c7_ece7_return_output;
     -- rom_byte_MUX[uxn_c_l31_c2_7a12] LATENCY=0
     -- Inputs
     rom_byte_MUX_uxn_c_l31_c2_7a12_cond <= VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_cond;
     rom_byte_MUX_uxn_c_l31_c2_7a12_iftrue <= VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_iftrue;
     rom_byte_MUX_uxn_c_l31_c2_7a12_iffalse <= VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_iffalse;
     -- Outputs
     VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_return_output := rom_byte_MUX_uxn_c_l31_c2_7a12_return_output;

     -- Submodule level 6
     REG_VAR_rom_byte := VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_return_output;
     -- CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece[uxn_c_l45_c9_62c9] LATENCY=0
     VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l45_c9_62c9_return_output := CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece(
     boot_phase,
     VAR_is_finished_MUX_uxn_c_l31_c2_7a12_return_output,
     VAR_rom_byte_MUX_uxn_c_l31_c2_7a12_return_output,
     VAR_ram_address_MUX_uxn_c_l31_c2_7a12_return_output);

     -- Submodule level 7
     VAR_return_output := VAR_CONST_REF_RD_boot_step_result_t_boot_step_result_t_4ece_uxn_c_l45_c9_62c9_return_output;
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