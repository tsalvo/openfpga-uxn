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
-- Submodules: 30
entity opc_inc_phased_0CLK_b2c89097 is
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
end opc_inc_phased_0CLK_b2c89097;
architecture arch of opc_inc_phased_0CLK_b2c89097 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l153_c6_9acc]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l153_c1_bdf1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l156_c7_b3ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l153_c2_a444]
signal t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l153_c2_a444]
signal result_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l154_c12_9eca]
signal set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l156_c11_7425]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l156_c1_ed48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l159_c7_3c5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l156_c7_b3ad]
signal t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l156_c7_b3ad]
signal result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l157_c8_3644]
signal t_register_uxn_opcodes_phased_h_l157_c8_3644_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l159_c11_da94]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l159_c1_7be8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l162_c7_f590]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l159_c7_3c5e]
signal t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l159_c7_3c5e]
signal result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l160_c8_6c62]
signal t_register_uxn_opcodes_phased_h_l160_c8_6c62_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l162_c11_125c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l162_c1_61d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l165_c7_acf1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l162_c7_f590]
signal result_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l163_c3_ce0f]
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l163_c3_ce0f_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l165_c11_22c7]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l165_c1_2bd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l165_c7_acf1]
signal result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l166_c33_d8b4]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output : unsigned(8 downto 0);

-- put_stack[uxn_opcodes_phased_h_l166_c3_a146]
signal put_stack_uxn_opcodes_phased_h_l166_c3_a146_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l166_c3_a146_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l166_c3_a146_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l166_c3_a146_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l166_c3_a146_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l168_c11_8dd5]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l168_c7_3867]
signal result_MUX_uxn_opcodes_phased_h_l168_c7_3867_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc
BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l153_c2_a444
t8_MUX_uxn_opcodes_phased_h_l153_c2_a444 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond,
t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue,
t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse,
t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output);

-- result_MUX_uxn_opcodes_phased_h_l153_c2_a444
result_MUX_uxn_opcodes_phased_h_l153_c2_a444 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond,
result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue,
result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse,
result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_sp,
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_k,
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_mul,
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_add,
set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425
BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad
t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond,
t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue,
t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse,
t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output);

-- result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad
result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond,
result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue,
result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse,
result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output);

-- t_register_uxn_opcodes_phased_h_l157_c8_3644
t_register_uxn_opcodes_phased_h_l157_c8_3644 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l157_c8_3644_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_index,
t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_ptr,
t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94
BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e
t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond,
t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue,
t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse,
t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e
result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond,
result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue,
result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse,
result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output);

-- t_register_uxn_opcodes_phased_h_l160_c8_6c62
t_register_uxn_opcodes_phased_h_l160_c8_6c62 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l160_c8_6c62_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_index,
t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_ptr,
t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c
BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output);

-- result_MUX_uxn_opcodes_phased_h_l162_c7_f590
result_MUX_uxn_opcodes_phased_h_l162_c7_f590 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond,
result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue,
result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse,
result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output);

-- set_uxn_opcodes_phased_h_l163_c3_ce0f
set_uxn_opcodes_phased_h_l163_c3_ce0f : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l163_c3_ce0f_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l163_c3_ce0f_sp,
set_uxn_opcodes_phased_h_l163_c3_ce0f_stack_index,
set_uxn_opcodes_phased_h_l163_c3_ce0f_ins,
set_uxn_opcodes_phased_h_l163_c3_ce0f_k,
set_uxn_opcodes_phased_h_l163_c3_ce0f_mul,
set_uxn_opcodes_phased_h_l163_c3_ce0f_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7
BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output);

-- result_MUX_uxn_opcodes_phased_h_l165_c7_acf1
result_MUX_uxn_opcodes_phased_h_l165_c7_acf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond,
result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue,
result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse,
result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4
BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output);

-- put_stack_uxn_opcodes_phased_h_l166_c3_a146
put_stack_uxn_opcodes_phased_h_l166_c3_a146 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l166_c3_a146_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l166_c3_a146_sp,
put_stack_uxn_opcodes_phased_h_l166_c3_a146_stack_index,
put_stack_uxn_opcodes_phased_h_l166_c3_a146_offset,
put_stack_uxn_opcodes_phased_h_l166_c3_a146_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5
BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output);

-- result_MUX_uxn_opcodes_phased_h_l168_c7_3867
result_MUX_uxn_opcodes_phased_h_l168_c7_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l168_c7_3867_cond,
result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iftrue,
result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iffalse,
result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output);



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
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output,
 t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output,
 result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output,
 set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output,
 t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output,
 result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output,
 t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output,
 t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output,
 result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output,
 t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output,
 result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output,
 result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output,
 result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output : unsigned(8 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_right := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_right := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_mul := resize(to_unsigned(1, 1), 8);
     VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_right := to_unsigned(3, 2);
     VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_right := to_unsigned(2, 2);
     VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_mul := resize(to_unsigned(1, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iffalse := result;
     VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_ptr := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_ptr := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_index := VAR_stack_index;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_left := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l159_c11_da94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l166_c33_d8b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l153_c6_9acc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l156_c11_7425] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l165_c11_22c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l162_c11_125c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l168_c11_8dd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l153_c6_9acc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l156_c11_7425_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l159_c11_da94_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l162_c11_125c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l165_c11_22c7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l168_c11_8dd5_return_output;
     VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_value := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l166_c33_d8b4_return_output, 8);
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l153_c1_bdf1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l156_c7_b3ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l168_c7_3867] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l168_c7_3867_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_cond;
     result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iftrue;
     result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output := result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l153_c1_bdf1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l168_c7_3867_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l159_c7_3c5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l156_c1_ed48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l165_c7_acf1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond;
     result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue;
     result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output := result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l154_c12_9eca] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_sp;
     set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_k;
     set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_mul;
     set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output := set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l156_c1_ed48_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l154_c12_9eca_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l162_c7_f590] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond;
     result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue;
     result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output := result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output;

     -- t_register[uxn_opcodes_phased_h_l157_c8_3644] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l157_c8_3644_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_index;
     t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output := t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l159_c1_7be8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l162_c7_f590] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l159_c1_7be8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l162_c7_f590_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue := VAR_t_register_uxn_opcodes_phased_h_l157_c8_3644_return_output;
     -- t_register[uxn_opcodes_phased_h_l160_c8_6c62] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l160_c8_6c62_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_index;
     t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output := t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l165_c7_acf1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l162_c1_61d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l159_c7_3c5e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond;
     result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output := result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c7_acf1_return_output;
     VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l162_c1_61d2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue := VAR_t_register_uxn_opcodes_phased_h_l160_c8_6c62_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l156_c7_b3ad] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond;
     result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue;
     result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output := result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;

     -- set[uxn_opcodes_phased_h_l163_c3_ce0f] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l163_c3_ce0f_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l163_c3_ce0f_sp <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_sp;
     set_uxn_opcodes_phased_h_l163_c3_ce0f_stack_index <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_stack_index;
     set_uxn_opcodes_phased_h_l163_c3_ce0f_ins <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_ins;
     set_uxn_opcodes_phased_h_l163_c3_ce0f_k <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_k;
     set_uxn_opcodes_phased_h_l163_c3_ce0f_mul <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_mul;
     set_uxn_opcodes_phased_h_l163_c3_ce0f_add <= VAR_set_uxn_opcodes_phased_h_l163_c3_ce0f_add;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l165_c1_2bd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l159_c7_3c5e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_cond;
     t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output := t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;

     -- Submodule level 6
     VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l165_c1_2bd6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l159_c7_3c5e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l153_c2_a444] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond;
     result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue;
     result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output := result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output;

     -- put_stack[uxn_opcodes_phased_h_l166_c3_a146] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l166_c3_a146_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l166_c3_a146_sp <= VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_sp;
     put_stack_uxn_opcodes_phased_h_l166_c3_a146_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_stack_index;
     put_stack_uxn_opcodes_phased_h_l166_c3_a146_offset <= VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_offset;
     put_stack_uxn_opcodes_phased_h_l166_c3_a146_value <= VAR_put_stack_uxn_opcodes_phased_h_l166_c3_a146_value;
     -- Outputs

     -- t8_MUX[uxn_opcodes_phased_h_l156_c7_b3ad] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_cond;
     t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output := t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l156_c7_b3ad_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l153_c2_a444] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_cond;
     t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output := t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output;

     -- Submodule level 8
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l153_c2_a444_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
