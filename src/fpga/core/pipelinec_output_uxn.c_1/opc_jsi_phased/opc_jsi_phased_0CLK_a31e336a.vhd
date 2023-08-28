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
-- Submodules: 37
entity opc_jsi_phased_0CLK_a31e336a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jsi_phased_0CLK_a31e336a;
architecture arch of opc_jsi_phased_0CLK_a31e336a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8a : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16a : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16b : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8a : unsigned(7 downto 0);
signal REG_COMB_tmp16a : unsigned(15 downto 0);
signal REG_COMB_tmp16b : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l74_c6_f30d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l77_c7_98cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l74_c2_6f49]
signal tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(15 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l74_c2_6f49]
signal tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l74_c2_6f49]
signal result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l74_c2_6f49]
signal tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(15 downto 0);

-- BIN_OP_GT[uxn_opcodes_phased_h_l75_c12_5555]
signal BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l77_c11_41f0]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l77_c1_a7e9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l83_c9_1b97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l77_c7_98cd]
signal tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(15 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l77_c7_98cd]
signal tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l77_c7_98cd]
signal result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l77_c7_98cd]
signal tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l78_c11_e11d]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l79_c12_edd8]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output : unsigned(16 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l80_c12_1903]
signal peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l80_c12_fce4]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output : unsigned(16 downto 0);

-- stack_pointer_set[uxn_opcodes_phased_h_l81_c3_6281]
signal stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_value : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_phased_h_l82_c45_2138]
signal CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l82_c3_c4f9]
signal stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l83_c13_0427]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l83_c1_1239]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output : unsigned(0 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l83_c9_1b97]
signal tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l83_c9_1b97]
signal result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(0 downto 0);

-- tmp16b_MUX[uxn_opcodes_phased_h_l83_c9_1b97]
signal tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(15 downto 0);
signal tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(15 downto 0);

-- stack_pointer_get[uxn_opcodes_phased_h_l84_c11_a0f1]
signal stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output : unsigned(7 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l85_c12_3e90]
signal peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l85_c12_1ced]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l86_c31_ffdf]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l86_c3_434e]
signal stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l87_c10_a782]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output : unsigned(16 downto 0);

-- pc_set[uxn_opcodes_phased_h_l87_c3_da55]
signal pc_set_uxn_opcodes_phased_h_l87_c3_da55_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_phased_h_l87_c3_da55_value : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l88_c13_95dc]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l88_c9_d158]
signal result_MUX_uxn_opcodes_phased_h_l88_c9_d158_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d
BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49
tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49
tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output);

-- result_MUX_uxn_opcodes_phased_h_l74_c2_6f49
result_MUX_uxn_opcodes_phased_h_l74_c2_6f49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond,
result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue,
result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse,
result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49
tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output);

-- BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555
BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_left,
BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_right,
BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0
BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd
tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd
tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output);

-- result_MUX_uxn_opcodes_phased_h_l77_c7_98cd
result_MUX_uxn_opcodes_phased_h_l77_c7_98cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond,
result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue,
result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse,
result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd
tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d
BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d : entity work.BIN_OP_PLUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8
BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l80_c12_1903
peek2_ram_uxn_opcodes_phased_h_l80_c12_1903 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_address,
peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4
BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output);

-- stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281
stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281 : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_CLOCK_ENABLE,
stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_stack_index,
stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_value);

-- CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138
CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_x,
CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9
stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_stack_index,
stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_address,
stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427
BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97
tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output);

-- result_MUX_uxn_opcodes_phased_h_l83_c9_1b97
result_MUX_uxn_opcodes_phased_h_l83_c9_1b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond,
result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue,
result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse,
result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output);

-- tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97
tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond,
tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue,
tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse,
tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output);

-- stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1
stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1 : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_CLOCK_ENABLE,
stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_stack_index,
stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90
peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_address,
peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced
BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf
BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l86_c3_434e
stack_data_set_uxn_opcodes_phased_h_l86_c3_434e : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_stack_index,
stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_address,
stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_value);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782
BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output);

-- pc_set_uxn_opcodes_phased_h_l87_c3_da55
pc_set_uxn_opcodes_phased_h_l87_c3_da55 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_phased_h_l87_c3_da55_CLOCK_ENABLE,
pc_set_uxn_opcodes_phased_h_l87_c3_da55_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc
BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output);

-- result_MUX_uxn_opcodes_phased_h_l88_c9_d158
result_MUX_uxn_opcodes_phased_h_l88_c9_d158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l88_c9_d158_cond,
result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iftrue,
result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iffalse,
result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 ins,
 -- Registers
 tmp8a,
 tmp16a,
 tmp16b,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output,
 result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output,
 BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output,
 result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output,
 peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output,
 CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output,
 result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output,
 tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output,
 stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output,
 peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output,
 result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_uxn_opcodes_phased_h_l79_c3_de37 : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_uxn_opcodes_phased_h_l78_c3_4b41 : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_uxn_opcodes_phased_h_l80_c3_5123 : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output : unsigned(16 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_left : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output : unsigned(16 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l82_c35_1f4c_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16b_uxn_opcodes_phased_h_l85_c3_f157 : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output : unsigned(7 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_address : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_left : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output : unsigned(16 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l86_c39_1993_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l87_c3_da55_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output : unsigned(16 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l87_c3_da55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8a : unsigned(7 downto 0);
variable REG_VAR_tmp16a : unsigned(15 downto 0);
variable REG_VAR_tmp16b : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8a := tmp8a;
  REG_VAR_tmp16a := tmp16a;
  REG_VAR_tmp16b := tmp16b;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_right := to_unsigned(3, 2);
     VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_right := to_unsigned(253, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_ins := ins;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_left := VAR_pc;
     VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_address := VAR_pc;
     VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_address := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iffalse := result;
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_left := VAR_sp;
     VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_address := VAR_sp;
     VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_stack_index := VAR_stack_index;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue := tmp16a;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse := tmp16a;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue := tmp16b;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse := tmp16b;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue := tmp8a;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse := tmp8a;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l78_c11_e11d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output;

     -- BIN_OP_GT[uxn_opcodes_phased_h_l75_c12_5555] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_left <= VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_left;
     BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_right <= VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output := BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l79_c12_edd8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_phased_h_l86_c39_1993] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l86_c39_1993_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16a);

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l77_c11_41f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l74_c6_f30d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l83_c13_0427] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l86_c31_ffdf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l88_c13_95dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l74_c6_f30d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l77_c11_41f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l83_c13_0427_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l88_c13_95dc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue := VAR_BIN_OP_GT_uxn_opcodes_phased_h_l75_c12_5555_return_output;
     VAR_tmp8a_uxn_opcodes_phased_h_l78_c3_4b41 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l78_c11_e11d_return_output, 8);
     VAR_tmp16a_uxn_opcodes_phased_h_l79_c3_de37 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l79_c12_edd8_return_output, 16);
     VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l86_c31_ffdf_return_output, 8);
     VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_value := VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l86_c39_1993_return_output;
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_x := VAR_tmp16a_uxn_opcodes_phased_h_l79_c3_de37;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue := VAR_tmp16a_uxn_opcodes_phased_h_l79_c3_de37;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_value := VAR_tmp8a_uxn_opcodes_phased_h_l78_c3_4b41;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue := VAR_tmp8a_uxn_opcodes_phased_h_l78_c3_4b41;
     -- CONST_SR_8[uxn_opcodes_phased_h_l82_c45_2138] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_x <= VAR_CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output := CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output;

     -- tmp16a_MUX[uxn_opcodes_phased_h_l77_c7_98cd] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l88_c9_d158] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l88_c9_d158_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_cond;
     result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iftrue;
     result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output := result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l77_c7_98cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l88_c9_d158_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;
     -- tmp16a_MUX[uxn_opcodes_phased_h_l74_c2_6f49] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l77_c1_a7e9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l83_c9_1b97] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond;
     result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue;
     result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output := result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l83_c9_1b97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_phased_h_l82_c35_1f4c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l82_c35_1f4c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l82_c45_2138_return_output);

     -- Submodule level 3
     VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_value := VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l82_c35_1f4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l77_c1_a7e9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;
     REG_VAR_tmp16a := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l77_c7_98cd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond;
     result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue;
     result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output := result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l82_c3_c4f9] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_address;
     stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l82_c3_c4f9_value;
     -- Outputs

     -- peek2_ram[uxn_opcodes_phased_h_l80_c12_1903] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output := peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l83_c1_1239] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output;

     -- stack_pointer_set[uxn_opcodes_phased_h_l81_c3_6281] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_stack_index <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_stack_index;
     stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_value <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l81_c3_6281_value;
     -- Outputs

     -- Submodule level 4
     VAR_pc_set_uxn_opcodes_phased_h_l87_c3_da55_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output;
     VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l83_c1_1239_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_left := VAR_peek2_ram_uxn_opcodes_phased_h_l80_c12_1903_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l80_c12_fce4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output;

     -- peek2_ram[uxn_opcodes_phased_h_l85_c12_3e90] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output := peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output;

     -- stack_pointer_get[uxn_opcodes_phased_h_l84_c11_a0f1] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_stack_index <= VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output := stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l74_c2_6f49] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond;
     result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue;
     result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output := result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l86_c3_434e] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_address;
     stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l86_c3_434e_value;
     -- Outputs

     -- Submodule level 5
     VAR_tmp16b_uxn_opcodes_phased_h_l80_c3_5123 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l80_c12_fce4_return_output, 16);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_left := VAR_peek2_ram_uxn_opcodes_phased_h_l85_c12_3e90_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue := VAR_stack_pointer_get_uxn_opcodes_phased_h_l84_c11_a0f1_return_output;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue := VAR_tmp16b_uxn_opcodes_phased_h_l80_c3_5123;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l85_c12_1ced] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output;

     -- tmp8a_MUX[uxn_opcodes_phased_h_l83_c9_1b97] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;

     -- Submodule level 6
     VAR_tmp16b_uxn_opcodes_phased_h_l85_c3_f157 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l85_c12_1ced_return_output, 16);
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_right := VAR_tmp16b_uxn_opcodes_phased_h_l85_c3_f157;
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue := VAR_tmp16b_uxn_opcodes_phased_h_l85_c3_f157;
     -- tmp8a_MUX[uxn_opcodes_phased_h_l77_c7_98cd] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;

     -- tmp16b_MUX[uxn_opcodes_phased_h_l83_c9_1b97] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l87_c10_a782] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output;

     -- Submodule level 7
     VAR_pc_set_uxn_opcodes_phased_h_l87_c3_da55_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l87_c10_a782_return_output, 16);
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l83_c9_1b97_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;
     -- pc_set[uxn_opcodes_phased_h_l87_c3_da55] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_phased_h_l87_c3_da55_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_phased_h_l87_c3_da55_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_phased_h_l87_c3_da55_value <= VAR_pc_set_uxn_opcodes_phased_h_l87_c3_da55_value;
     -- Outputs

     -- tmp16b_MUX[uxn_opcodes_phased_h_l77_c7_98cd] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;

     -- tmp8a_MUX[uxn_opcodes_phased_h_l74_c2_6f49] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;

     -- Submodule level 8
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l77_c7_98cd_return_output;
     REG_VAR_tmp8a := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;
     -- tmp16b_MUX[uxn_opcodes_phased_h_l74_c2_6f49] LATENCY=0
     -- Inputs
     tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_cond;
     tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iftrue;
     tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse <= VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_iffalse;
     -- Outputs
     VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output := tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;

     -- Submodule level 9
     REG_VAR_tmp16b := VAR_tmp16b_MUX_uxn_opcodes_phased_h_l74_c2_6f49_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8a <= REG_VAR_tmp8a;
REG_COMB_tmp16a <= REG_VAR_tmp16a;
REG_COMB_tmp16b <= REG_VAR_tmp16b;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8a <= REG_COMB_tmp8a;
     tmp16a <= REG_COMB_tmp16a;
     tmp16b <= REG_COMB_tmp16b;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
