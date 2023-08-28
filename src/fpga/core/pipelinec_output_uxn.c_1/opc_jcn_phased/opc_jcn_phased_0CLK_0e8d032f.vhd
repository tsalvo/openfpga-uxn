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
-- Submodules: 35
entity opc_jcn_phased_0CLK_0e8d032f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_jcn_phased_0CLK_0e8d032f;
architecture arch of opc_jcn_phased_0CLK_0e8d032f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l585_c6_7ee0]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l585_c1_d7dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l588_c7_ff94]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l585_c2_5a45]
signal t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l585_c2_5a45]
signal n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l585_c2_5a45]
signal result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l586_c12_1b31]
signal set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l588_c11_56c2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l588_c1_ecad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l591_c7_1cd5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l588_c7_ff94]
signal t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l588_c7_ff94]
signal n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l588_c7_ff94]
signal result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l589_c8_eda9]
signal t_register_uxn_opcodes_phased_h_l589_c8_eda9_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l591_c11_3204]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l591_c1_db23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l594_c7_3454]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l591_c7_1cd5]
signal t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l591_c7_1cd5]
signal n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l591_c7_1cd5]
signal result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(0 downto 0);

-- n_register[uxn_opcodes_phased_h_l592_c8_1fd5]
signal n_register_uxn_opcodes_phased_h_l592_c8_1fd5_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l594_c11_9061]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l594_c1_85ec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l597_c7_410d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l594_c7_3454]
signal n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l594_c7_3454]
signal result_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output : unsigned(0 downto 0);

-- n_register[uxn_opcodes_phased_h_l595_c8_3ecb]
signal n_register_uxn_opcodes_phased_h_l595_c8_3ecb_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l597_c11_32fd]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l597_c1_4329]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l597_c7_410d]
signal result_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l598_c3_104c]
signal set_uxn_opcodes_phased_h_l598_c3_104c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l598_c3_104c_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l598_c3_104c_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l598_c3_104c_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l598_c3_104c_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l598_c3_104c_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l598_c3_104c_add : signed(7 downto 0);

-- pc_add_s8[uxn_opcodes_phased_h_l599_c3_40e4]
signal pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_pc : unsigned(15 downto 0);
signal pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_adjustment : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l601_c11_036a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l601_c7_7f02]
signal result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0
BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45
t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond,
t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue,
t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse,
t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45
n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond,
n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue,
n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse,
n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output);

-- result_MUX_uxn_opcodes_phased_h_l585_c2_5a45
result_MUX_uxn_opcodes_phased_h_l585_c2_5a45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond,
result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue,
result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse,
result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_sp,
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_k,
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_mul,
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_add,
set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2
BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94
t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond,
t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue,
t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse,
t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94
n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond,
n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue,
n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse,
n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output);

-- result_MUX_uxn_opcodes_phased_h_l588_c7_ff94
result_MUX_uxn_opcodes_phased_h_l588_c7_ff94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond,
result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue,
result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse,
result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output);

-- t_register_uxn_opcodes_phased_h_l589_c8_eda9
t_register_uxn_opcodes_phased_h_l589_c8_eda9 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l589_c8_eda9_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_index,
t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_ptr,
t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204
BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5
t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond,
t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue,
t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse,
t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5
n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond,
n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue,
n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse,
n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output);

-- result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5
result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond,
result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue,
result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse,
result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output);

-- n_register_uxn_opcodes_phased_h_l592_c8_1fd5
n_register_uxn_opcodes_phased_h_l592_c8_1fd5 : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l592_c8_1fd5_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_index,
n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_ptr,
n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061
BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l594_c7_3454
n8_MUX_uxn_opcodes_phased_h_l594_c7_3454 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond,
n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue,
n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse,
n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output);

-- result_MUX_uxn_opcodes_phased_h_l594_c7_3454
result_MUX_uxn_opcodes_phased_h_l594_c7_3454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond,
result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue,
result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse,
result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output);

-- n_register_uxn_opcodes_phased_h_l595_c8_3ecb
n_register_uxn_opcodes_phased_h_l595_c8_3ecb : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l595_c8_3ecb_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_index,
n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_ptr,
n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd
BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output);

-- result_MUX_uxn_opcodes_phased_h_l597_c7_410d
result_MUX_uxn_opcodes_phased_h_l597_c7_410d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond,
result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue,
result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse,
result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output);

-- set_uxn_opcodes_phased_h_l598_c3_104c
set_uxn_opcodes_phased_h_l598_c3_104c : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l598_c3_104c_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l598_c3_104c_sp,
set_uxn_opcodes_phased_h_l598_c3_104c_stack_index,
set_uxn_opcodes_phased_h_l598_c3_104c_ins,
set_uxn_opcodes_phased_h_l598_c3_104c_k,
set_uxn_opcodes_phased_h_l598_c3_104c_mul,
set_uxn_opcodes_phased_h_l598_c3_104c_add);

-- pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4
pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4 : entity work.pc_add_s8_0CLK_23f04728 port map (
clk,
pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_pc,
pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_adjustment);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a
BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l601_c7_7f02
result_MUX_uxn_opcodes_phased_h_l601_c7_7f02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_cond,
result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iftrue,
result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iffalse,
result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 ins,
 k,
 -- Registers
 n8,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output,
 t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output,
 n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output,
 result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output,
 set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output,
 t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output,
 n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output,
 result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output,
 t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output,
 t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output,
 n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output,
 result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output,
 n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output,
 n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output,
 result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output,
 n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output,
 result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output,
 result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l598_c3_104c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_pc : unsigned(15 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l599_c17_b87b_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_right := to_unsigned(4, 3);
     VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_right := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_add := resize(to_signed(-2, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iffalse := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_mul := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_right := to_unsigned(2, 2);
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_add := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iffalse := to_unsigned(0, 1);

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
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_k := VAR_k;
     VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse := n8;
     VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_pc := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iffalse := result;
     VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_ptr := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_index := VAR_stack_index;
     VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_index := VAR_stack_index;
     VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l588_c11_56c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l591_c11_3204] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l594_c11_9061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l585_c6_7ee0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_phased_h_l599_c17_b87b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l599_c17_b87b_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l597_c11_32fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l601_c11_036a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l585_c6_7ee0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l588_c11_56c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l591_c11_3204_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l594_c11_9061_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l597_c11_32fd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l601_c11_036a_return_output;
     VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l599_c17_b87b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l588_c7_ff94] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l601_c7_7f02] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_cond;
     result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iftrue;
     result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output := result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l585_c1_d7dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l585_c1_d7dd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l601_c7_7f02_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l591_c7_1cd5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l588_c1_ecad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l586_c12_1b31] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_sp;
     set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_k;
     set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_mul;
     set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output := set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l597_c7_410d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond;
     result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue;
     result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output := result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l588_c1_ecad_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l586_c12_1b31_return_output;
     -- t_register[uxn_opcodes_phased_h_l589_c8_eda9] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l589_c8_eda9_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_index;
     t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output := t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l594_c7_3454] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond;
     result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue;
     result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output := result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l594_c7_3454] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l591_c1_db23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l591_c1_db23_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue := VAR_t_register_uxn_opcodes_phased_h_l589_c8_eda9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l597_c7_410d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output;

     -- n_register[uxn_opcodes_phased_h_l592_c8_1fd5] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l592_c8_1fd5_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_index;
     n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output := n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l591_c7_1cd5] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond;
     result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue;
     result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output := result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l594_c1_85ec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c7_410d_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l594_c1_85ec_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue := VAR_n_register_uxn_opcodes_phased_h_l592_c8_1fd5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l591_c7_1cd5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond;
     t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output := t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;

     -- n_register[uxn_opcodes_phased_h_l595_c8_3ecb] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l595_c8_3ecb_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_index;
     n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output := n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l588_c7_ff94] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond;
     result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue;
     result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output := result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l597_c1_4329] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output;

     -- Submodule level 6
     VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output;
     VAR_set_uxn_opcodes_phased_h_l598_c3_104c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l597_c1_4329_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue := VAR_n_register_uxn_opcodes_phased_h_l595_c8_3ecb_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;
     -- set[uxn_opcodes_phased_h_l598_c3_104c] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l598_c3_104c_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l598_c3_104c_sp <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_sp;
     set_uxn_opcodes_phased_h_l598_c3_104c_stack_index <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_stack_index;
     set_uxn_opcodes_phased_h_l598_c3_104c_ins <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_ins;
     set_uxn_opcodes_phased_h_l598_c3_104c_k <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_k;
     set_uxn_opcodes_phased_h_l598_c3_104c_mul <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_mul;
     set_uxn_opcodes_phased_h_l598_c3_104c_add <= VAR_set_uxn_opcodes_phased_h_l598_c3_104c_add;
     -- Outputs

     -- pc_add_s8[uxn_opcodes_phased_h_l599_c3_40e4] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_pc <= VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_pc;
     pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_adjustment <= VAR_pc_add_s8_uxn_opcodes_phased_h_l599_c3_40e4_adjustment;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l585_c2_5a45] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond;
     result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue;
     result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output := result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l594_c7_3454] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_cond;
     n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output := n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l588_c7_ff94] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond;
     t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output := t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l594_c7_3454_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l585_c2_5a45] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond;
     t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output := t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l591_c7_1cd5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_cond;
     n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output := n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;

     -- Submodule level 8
     VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l591_c7_1cd5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;
     -- n8_MUX[uxn_opcodes_phased_h_l588_c7_ff94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_cond;
     n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output := n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;

     -- Submodule level 9
     VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l588_c7_ff94_return_output;
     -- n8_MUX[uxn_opcodes_phased_h_l585_c2_5a45] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_cond;
     n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output := n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;

     -- Submodule level 10
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_phased_h_l585_c2_5a45_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
