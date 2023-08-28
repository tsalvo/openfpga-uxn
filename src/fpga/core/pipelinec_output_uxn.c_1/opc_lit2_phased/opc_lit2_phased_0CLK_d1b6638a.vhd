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
-- Submodules: 34
entity opc_lit2_phased_0CLK_d1b6638a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_lit2_phased_0CLK_d1b6638a;
architecture arch of opc_lit2_phased_0CLK_d1b6638a is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8a : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16a : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp8a : unsigned(7 downto 0);
signal REG_COMB_tmp16a : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l125_c6_6b2b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l128_c7_d7fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l125_c2_c2ee]
signal tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output : unsigned(15 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l125_c2_c2ee]
signal tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l125_c2_c2ee]
signal result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output : unsigned(0 downto 0);

-- BIN_OP_GT[uxn_opcodes_phased_h_l126_c12_46cf]
signal BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l128_c11_bd50]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l128_c1_98ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l134_c7_4200]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l128_c7_d7fc]
signal tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(15 downto 0);

-- tmp8a_MUX[uxn_opcodes_phased_h_l128_c7_d7fc]
signal tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(7 downto 0);
signal tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l128_c7_d7fc]
signal result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l129_c11_cf05]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output : unsigned(8 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l130_c12_fd8e]
signal peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l131_c10_7676]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output : unsigned(16 downto 0);

-- pc_set[uxn_opcodes_phased_h_l131_c3_ff12]
signal pc_set_uxn_opcodes_phased_h_l131_c3_ff12_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_phased_h_l131_c3_ff12_value : unsigned(15 downto 0);

-- stack_pointer_set[uxn_opcodes_phased_h_l132_c3_0ccb]
signal stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l134_c11_0fd4]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l134_c1_17c4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l138_c7_e6d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output : unsigned(0 downto 0);

-- tmp16a_MUX[uxn_opcodes_phased_h_l134_c7_4200]
signal tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond : unsigned(0 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse : unsigned(15 downto 0);
signal tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l134_c7_4200]
signal result_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output : unsigned(0 downto 0);

-- peek2_ram[uxn_opcodes_phased_h_l135_c12_4422]
signal peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_address : unsigned(15 downto 0);
signal peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_phased_h_l136_c45_aa49]
signal CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l136_c3_9178]
signal stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l138_c11_596f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l138_c1_c1fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l138_c7_e6d2]
signal result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l139_c31_da82]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l139_c3_09be]
signal stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l141_c11_dba2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l141_c7_a404]
signal result_MUX_uxn_opcodes_phased_h_l141_c7_a404_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b
BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee
tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee
tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output);

-- result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee
result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond,
result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue,
result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse,
result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output);

-- BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf
BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_left,
BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_right,
BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50
BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc
tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output);

-- tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc
tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond,
tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue,
tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse,
tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output);

-- result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc
result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond,
result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue,
result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse,
result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05
BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05 : entity work.BIN_OP_PLUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e
peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_address,
peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676
BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output);

-- pc_set_uxn_opcodes_phased_h_l131_c3_ff12
pc_set_uxn_opcodes_phased_h_l131_c3_ff12 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_phased_h_l131_c3_ff12_CLOCK_ENABLE,
pc_set_uxn_opcodes_phased_h_l131_c3_ff12_value);

-- stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb
stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_CLOCK_ENABLE,
stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_stack_index,
stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4
BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output);

-- tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200
tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond,
tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue,
tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse,
tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output);

-- result_MUX_uxn_opcodes_phased_h_l134_c7_4200
result_MUX_uxn_opcodes_phased_h_l134_c7_4200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond,
result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue,
result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse,
result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output);

-- peek2_ram_uxn_opcodes_phased_h_l135_c12_4422
peek2_ram_uxn_opcodes_phased_h_l135_c12_4422 : entity work.peek2_ram_0CLK_7bf2eff3 port map (
clk,
peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_CLOCK_ENABLE,
peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_address,
peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output);

-- CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49
CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_x,
CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l136_c3_9178
stack_data_set_uxn_opcodes_phased_h_l136_c3_9178 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_stack_index,
stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_address,
stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f
BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output);

-- result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2
result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond,
result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue,
result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse,
result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82
BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l139_c3_09be
stack_data_set_uxn_opcodes_phased_h_l139_c3_09be : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_stack_index,
stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_address,
stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2
BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output);

-- result_MUX_uxn_opcodes_phased_h_l141_c7_a404
result_MUX_uxn_opcodes_phased_h_l141_c7_a404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l141_c7_a404_cond,
result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iftrue,
result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iffalse,
result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output,
 result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output,
 BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output,
 tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output,
 result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output,
 peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output,
 tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output,
 result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output,
 peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output,
 CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output,
 result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output,
 result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8a_uxn_opcodes_phased_h_l129_c3_02d7 : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output : unsigned(8 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l131_c3_ff12_value : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output : unsigned(16 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l131_c3_ff12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_address : unsigned(15 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output : unsigned(15 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l136_c35_f4ba_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l139_c39_e263_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp8a : unsigned(7 downto 0);
variable REG_VAR_tmp16a : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8a := tmp8a;
  REG_VAR_tmp16a := tmp16a;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_right := to_unsigned(1, 1);
     VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_right := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_left := VAR_pc;
     VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_address := VAR_pc;
     VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_address := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iffalse := result;
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_left := VAR_sp;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_left := VAR_sp;
     VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_address := VAR_sp;
     VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_stack_index := VAR_stack_index;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue := tmp16a;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse := tmp16a;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue := tmp8a;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse := tmp8a;
     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l131_c10_7676] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l134_c11_0fd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l129_c11_cf05] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_phased_h_l139_c39_e263] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l139_c39_e263_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16a);

     -- BIN_OP_GT[uxn_opcodes_phased_h_l126_c12_46cf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_left <= VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_left;
     BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_right <= VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output := BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l125_c6_6b2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l141_c11_dba2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l128_c11_bd50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l138_c11_596f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l139_c31_da82] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l125_c6_6b2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l128_c11_bd50_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l134_c11_0fd4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l138_c11_596f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l141_c11_dba2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue := VAR_BIN_OP_GT_uxn_opcodes_phased_h_l126_c12_46cf_return_output;
     VAR_tmp8a_uxn_opcodes_phased_h_l129_c3_02d7 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l129_c11_cf05_return_output, 8);
     VAR_pc_set_uxn_opcodes_phased_h_l131_c3_ff12_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l131_c10_7676_return_output, 16);
     VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l139_c31_da82_return_output, 8);
     VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_value := VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l139_c39_e263_return_output;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_value := VAR_tmp8a_uxn_opcodes_phased_h_l129_c3_02d7;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue := VAR_tmp8a_uxn_opcodes_phased_h_l129_c3_02d7;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l128_c7_d7fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;

     -- tmp8a_MUX[uxn_opcodes_phased_h_l128_c7_d7fc] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l141_c7_a404] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l141_c7_a404_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_cond;
     result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iftrue;
     result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output := result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l141_c7_a404_return_output;
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l134_c7_4200] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l128_c1_98ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l138_c7_e6d2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond;
     result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue;
     result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output := result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output;

     -- tmp8a_MUX[uxn_opcodes_phased_h_l125_c2_c2ee] LATENCY=0
     -- Inputs
     tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond;
     tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue;
     tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse <= VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse;
     -- Outputs
     VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output := tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;
     VAR_pc_set_uxn_opcodes_phased_h_l131_c3_ff12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output;
     VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l128_c1_98ea_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output;
     REG_VAR_tmp8a := VAR_tmp8a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;
     -- pc_set[uxn_opcodes_phased_h_l131_c3_ff12] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_phased_h_l131_c3_ff12_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_phased_h_l131_c3_ff12_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_phased_h_l131_c3_ff12_value <= VAR_pc_set_uxn_opcodes_phased_h_l131_c3_ff12_value;
     -- Outputs

     -- stack_pointer_set[uxn_opcodes_phased_h_l132_c3_0ccb] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_stack_index <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_stack_index;
     stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_value <= VAR_stack_pointer_set_uxn_opcodes_phased_h_l132_c3_0ccb_value;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l134_c1_17c4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output;

     -- peek2_ram[uxn_opcodes_phased_h_l130_c12_fd8e] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output := peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l134_c7_4200] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond;
     result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue;
     result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output := result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l138_c7_e6d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c7_e6d2_return_output;
     VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l134_c1_17c4_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue := VAR_peek2_ram_uxn_opcodes_phased_h_l130_c12_fd8e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l138_c1_c1fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output;

     -- peek2_ram[uxn_opcodes_phased_h_l135_c12_4422] LATENCY=0
     -- Clock enable
     peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_CLOCK_ENABLE <= VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_CLOCK_ENABLE;
     -- Inputs
     peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_address <= VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_address;
     -- Outputs
     VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output := peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l128_c7_d7fc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond;
     result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue;
     result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output := result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l138_c1_c1fd_return_output;
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_x := VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue := VAR_peek2_ram_uxn_opcodes_phased_h_l135_c12_4422_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;
     -- CONST_SR_8[uxn_opcodes_phased_h_l136_c45_aa49] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_x <= VAR_CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output := CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l139_c3_09be] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_address;
     stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l139_c3_09be_value;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l125_c2_c2ee] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond;
     result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue;
     result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output := result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;

     -- tmp16a_MUX[uxn_opcodes_phased_h_l134_c7_4200] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l134_c7_4200_return_output;
     -- tmp16a_MUX[uxn_opcodes_phased_h_l128_c7_d7fc] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_phased_h_l136_c35_f4ba] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l136_c35_f4ba_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l136_c45_aa49_return_output);

     -- Submodule level 7
     VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_value := VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l136_c35_f4ba_return_output;
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l128_c7_d7fc_return_output;
     -- stack_data_set[uxn_opcodes_phased_h_l136_c3_9178] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_address;
     stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l136_c3_9178_value;
     -- Outputs

     -- tmp16a_MUX[uxn_opcodes_phased_h_l125_c2_c2ee] LATENCY=0
     -- Inputs
     tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_cond;
     tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iftrue;
     tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse <= VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_iffalse;
     -- Outputs
     VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output := tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;

     -- Submodule level 8
     REG_VAR_tmp16a := VAR_tmp16a_MUX_uxn_opcodes_phased_h_l125_c2_c2ee_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8a <= REG_VAR_tmp8a;
REG_COMB_tmp16a <= REG_VAR_tmp16a;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8a <= REG_COMB_tmp8a;
     tmp16a <= REG_COMB_tmp16a;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
