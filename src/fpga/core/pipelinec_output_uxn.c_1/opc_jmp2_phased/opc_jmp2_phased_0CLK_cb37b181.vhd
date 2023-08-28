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
-- Submodules: 25
entity opc_jmp2_phased_0CLK_cb37b181 is
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
end opc_jmp2_phased_0CLK_cb37b181;
architecture arch of opc_jmp2_phased_0CLK_cb37b181 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l560_c6_c302]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l560_c1_5637]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l563_c7_ba78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l560_c2_130f]
signal t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l560_c2_130f]
signal result_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l561_c12_535a]
signal set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l563_c11_fc3f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l563_c1_7511]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l566_c7_6f64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l563_c7_ba78]
signal t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l563_c7_ba78]
signal result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output : unsigned(0 downto 0);

-- t2_register[uxn_opcodes_phased_h_l564_c9_cbef]
signal t2_register_uxn_opcodes_phased_h_l564_c9_cbef_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_ptr : unsigned(7 downto 0);
signal t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l566_c11_55e9]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l566_c1_6d8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l569_c7_491d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l566_c7_6f64]
signal t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l566_c7_6f64]
signal result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output : unsigned(0 downto 0);

-- t2_register[uxn_opcodes_phased_h_l567_c9_472b]
signal t2_register_uxn_opcodes_phased_h_l567_c9_472b_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_ptr : unsigned(7 downto 0);
signal t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l569_c11_5b48]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l569_c1_7ba0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l569_c7_491d]
signal result_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l570_c3_9b15]
signal set_uxn_opcodes_phased_h_l570_c3_9b15_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l570_c3_9b15_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l570_c3_9b15_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l570_c3_9b15_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l570_c3_9b15_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l570_c3_9b15_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l570_c3_9b15_add : signed(7 downto 0);

-- pc_set[uxn_opcodes_phased_h_l571_c3_92c8]
signal pc_set_uxn_opcodes_phased_h_l571_c3_92c8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_set_uxn_opcodes_phased_h_l571_c3_92c8_value : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l573_c11_a2d1]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l573_c7_cb86]
signal result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302
BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l560_c2_130f
t16_MUX_uxn_opcodes_phased_h_l560_c2_130f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond,
t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue,
t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse,
t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output);

-- result_MUX_uxn_opcodes_phased_h_l560_c2_130f
result_MUX_uxn_opcodes_phased_h_l560_c2_130f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond,
result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue,
result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse,
result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l561_c12_535a
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_sp,
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_k,
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_mul,
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_add,
set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f
BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78
t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond,
t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue,
t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse,
t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output);

-- result_MUX_uxn_opcodes_phased_h_l563_c7_ba78
result_MUX_uxn_opcodes_phased_h_l563_c7_ba78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond,
result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue,
result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse,
result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output);

-- t2_register_uxn_opcodes_phased_h_l564_c9_cbef
t2_register_uxn_opcodes_phased_h_l564_c9_cbef : entity work.t2_register_0CLK_a2cd5ea9 port map (
clk,
t2_register_uxn_opcodes_phased_h_l564_c9_cbef_CLOCK_ENABLE,
t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_index,
t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_ptr,
t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9
BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64
t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond,
t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue,
t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse,
t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output);

-- result_MUX_uxn_opcodes_phased_h_l566_c7_6f64
result_MUX_uxn_opcodes_phased_h_l566_c7_6f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond,
result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue,
result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse,
result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output);

-- t2_register_uxn_opcodes_phased_h_l567_c9_472b
t2_register_uxn_opcodes_phased_h_l567_c9_472b : entity work.t2_register_0CLK_a2cd5ea9 port map (
clk,
t2_register_uxn_opcodes_phased_h_l567_c9_472b_CLOCK_ENABLE,
t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_index,
t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_ptr,
t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48
BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output);

-- result_MUX_uxn_opcodes_phased_h_l569_c7_491d
result_MUX_uxn_opcodes_phased_h_l569_c7_491d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond,
result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue,
result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse,
result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output);

-- set_uxn_opcodes_phased_h_l570_c3_9b15
set_uxn_opcodes_phased_h_l570_c3_9b15 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l570_c3_9b15_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l570_c3_9b15_sp,
set_uxn_opcodes_phased_h_l570_c3_9b15_stack_index,
set_uxn_opcodes_phased_h_l570_c3_9b15_ins,
set_uxn_opcodes_phased_h_l570_c3_9b15_k,
set_uxn_opcodes_phased_h_l570_c3_9b15_mul,
set_uxn_opcodes_phased_h_l570_c3_9b15_add);

-- pc_set_uxn_opcodes_phased_h_l571_c3_92c8
pc_set_uxn_opcodes_phased_h_l571_c3_92c8 : entity work.pc_set_0CLK_de264c78 port map (
pc_set_uxn_opcodes_phased_h_l571_c3_92c8_CLOCK_ENABLE,
pc_set_uxn_opcodes_phased_h_l571_c3_92c8_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1
BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output);

-- result_MUX_uxn_opcodes_phased_h_l573_c7_cb86
result_MUX_uxn_opcodes_phased_h_l573_c7_cb86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_cond,
result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iftrue,
result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iffalse,
result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output);



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
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output,
 t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output,
 result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output,
 set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output,
 t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output,
 result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output,
 t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output,
 t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output,
 result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output,
 t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output,
 result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output,
 result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_ptr : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_ptr : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l571_c3_92c8_value : unsigned(15 downto 0);
 variable VAR_pc_set_uxn_opcodes_phased_h_l571_c3_92c8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_add := resize(to_signed(-2, 3), 8);
     VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iffalse := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_add := resize(to_signed(-2, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_right := to_unsigned(2, 2);
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_right := to_unsigned(1, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_mul := resize(to_unsigned(2, 2), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iffalse := result;
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_sp := VAR_sp;
     VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_ptr := VAR_sp;
     VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_ptr := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_index := VAR_stack_index;
     VAR_pc_set_uxn_opcodes_phased_h_l571_c3_92c8_value := t16;
     VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l566_c11_55e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l573_c11_a2d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l563_c11_fc3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l560_c6_c302] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l569_c11_5b48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l560_c6_c302_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l563_c11_fc3f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l566_c11_55e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l569_c11_5b48_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l573_c11_a2d1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l560_c1_5637] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l573_c7_cb86] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_cond;
     result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iftrue;
     result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output := result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l563_c7_ba78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l560_c1_5637_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l573_c7_cb86_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l566_c7_6f64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l561_c12_535a] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_sp;
     set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_k;
     set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_mul;
     set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output := set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l569_c7_491d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond;
     result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue;
     result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output := result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l563_c1_7511] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;
     VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l563_c1_7511_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l561_c12_535a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l566_c1_6d8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l569_c7_491d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l566_c7_6f64] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond;
     result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue;
     result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output := result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;

     -- t2_register[uxn_opcodes_phased_h_l564_c9_cbef] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_phased_h_l564_c9_cbef_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_index <= VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_index;
     t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_ptr <= VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_stack_ptr;
     -- Outputs
     VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output := t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c7_491d_return_output;
     VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l566_c1_6d8e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue := VAR_t2_register_uxn_opcodes_phased_h_l564_c9_cbef_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l569_c1_7ba0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l563_c7_ba78] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond;
     result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue;
     result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output := result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;

     -- t2_register[uxn_opcodes_phased_h_l567_c9_472b] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_phased_h_l567_c9_472b_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_index <= VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_index;
     t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_ptr <= VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_stack_ptr;
     -- Outputs
     VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output := t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output;

     -- Submodule level 5
     VAR_pc_set_uxn_opcodes_phased_h_l571_c3_92c8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output;
     VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l569_c1_7ba0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue := VAR_t2_register_uxn_opcodes_phased_h_l567_c9_472b_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l560_c2_130f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond;
     result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue;
     result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output := result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output;

     -- pc_set[uxn_opcodes_phased_h_l571_c3_92c8] LATENCY=0
     -- Clock enable
     pc_set_uxn_opcodes_phased_h_l571_c3_92c8_CLOCK_ENABLE <= VAR_pc_set_uxn_opcodes_phased_h_l571_c3_92c8_CLOCK_ENABLE;
     -- Inputs
     pc_set_uxn_opcodes_phased_h_l571_c3_92c8_value <= VAR_pc_set_uxn_opcodes_phased_h_l571_c3_92c8_value;
     -- Outputs

     -- t16_MUX[uxn_opcodes_phased_h_l566_c7_6f64] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_cond;
     t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output := t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;

     -- set[uxn_opcodes_phased_h_l570_c3_9b15] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l570_c3_9b15_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l570_c3_9b15_sp <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_sp;
     set_uxn_opcodes_phased_h_l570_c3_9b15_stack_index <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_stack_index;
     set_uxn_opcodes_phased_h_l570_c3_9b15_ins <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_ins;
     set_uxn_opcodes_phased_h_l570_c3_9b15_k <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_k;
     set_uxn_opcodes_phased_h_l570_c3_9b15_mul <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_mul;
     set_uxn_opcodes_phased_h_l570_c3_9b15_add <= VAR_set_uxn_opcodes_phased_h_l570_c3_9b15_add;
     -- Outputs

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse := VAR_t16_MUX_uxn_opcodes_phased_h_l566_c7_6f64_return_output;
     -- t16_MUX[uxn_opcodes_phased_h_l563_c7_ba78] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_cond;
     t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output := t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;

     -- Submodule level 7
     VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse := VAR_t16_MUX_uxn_opcodes_phased_h_l563_c7_ba78_return_output;
     -- t16_MUX[uxn_opcodes_phased_h_l560_c2_130f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_cond;
     t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output := t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output;

     -- Submodule level 8
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_phased_h_l560_c2_130f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
