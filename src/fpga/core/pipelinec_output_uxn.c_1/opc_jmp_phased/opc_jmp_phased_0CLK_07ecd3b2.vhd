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
-- Submodules: 26
entity opc_jmp_phased_0CLK_07ecd3b2 is
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
end opc_jmp_phased_0CLK_07ecd3b2;
architecture arch of opc_jmp_phased_0CLK_07ecd3b2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l537_c6_66c8]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l537_c1_eb9d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l540_c7_cb81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l537_c2_4dcc]
signal t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l537_c2_4dcc]
signal result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l538_c12_f3c1]
signal set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l540_c11_683f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l540_c1_1b4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l543_c7_3ed8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l540_c7_cb81]
signal t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l540_c7_cb81]
signal result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l541_c8_e87a]
signal t_register_uxn_opcodes_phased_h_l541_c8_e87a_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l543_c11_6f97]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l543_c1_337d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l546_c7_92bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l543_c7_3ed8]
signal t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l543_c7_3ed8]
signal result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l544_c8_34c5]
signal t_register_uxn_opcodes_phased_h_l544_c8_34c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l546_c11_e723]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l546_c1_99cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l546_c7_92bf]
signal result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l547_c3_1085]
signal set_uxn_opcodes_phased_h_l547_c3_1085_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l547_c3_1085_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l547_c3_1085_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l547_c3_1085_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l547_c3_1085_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l547_c3_1085_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l547_c3_1085_add : signed(7 downto 0);

-- pc_add_s8[uxn_opcodes_phased_h_l548_c3_a9b8]
signal pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_pc : unsigned(15 downto 0);
signal pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_adjustment : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l550_c11_e67d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l550_c7_2814]
signal result_MUX_uxn_opcodes_phased_h_l550_c7_2814_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8
BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc
t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond,
t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue,
t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse,
t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output);

-- result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc
result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond,
result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue,
result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse,
result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_sp,
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_k,
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_mul,
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_add,
set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f
BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81
t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond,
t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue,
t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse,
t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output);

-- result_MUX_uxn_opcodes_phased_h_l540_c7_cb81
result_MUX_uxn_opcodes_phased_h_l540_c7_cb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond,
result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue,
result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse,
result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output);

-- t_register_uxn_opcodes_phased_h_l541_c8_e87a
t_register_uxn_opcodes_phased_h_l541_c8_e87a : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l541_c8_e87a_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_index,
t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_ptr,
t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97
BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8
t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond,
t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue,
t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse,
t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output);

-- result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8
result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond,
result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue,
result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse,
result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output);

-- t_register_uxn_opcodes_phased_h_l544_c8_34c5
t_register_uxn_opcodes_phased_h_l544_c8_34c5 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l544_c8_34c5_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_index,
t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_ptr,
t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723
BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output);

-- result_MUX_uxn_opcodes_phased_h_l546_c7_92bf
result_MUX_uxn_opcodes_phased_h_l546_c7_92bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond,
result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue,
result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse,
result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output);

-- set_uxn_opcodes_phased_h_l547_c3_1085
set_uxn_opcodes_phased_h_l547_c3_1085 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l547_c3_1085_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l547_c3_1085_sp,
set_uxn_opcodes_phased_h_l547_c3_1085_stack_index,
set_uxn_opcodes_phased_h_l547_c3_1085_ins,
set_uxn_opcodes_phased_h_l547_c3_1085_k,
set_uxn_opcodes_phased_h_l547_c3_1085_mul,
set_uxn_opcodes_phased_h_l547_c3_1085_add);

-- pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8
pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8 : entity work.pc_add_s8_0CLK_23f04728 port map (
clk,
pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_CLOCK_ENABLE,
pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_pc,
pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_adjustment);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d
BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output);

-- result_MUX_uxn_opcodes_phased_h_l550_c7_2814
result_MUX_uxn_opcodes_phased_h_l550_c7_2814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l550_c7_2814_cond,
result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iftrue,
result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iffalse,
result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output,
 t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output,
 result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output,
 set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output,
 t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output,
 result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output,
 t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output,
 t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output,
 result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output,
 t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output,
 result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output,
 result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l547_c3_1085_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_pc : unsigned(15 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_adjustment : signed(7 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l548_c17_7638_return_output : signed(7 downto 0);
 variable VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_add := resize(to_signed(-1, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iffalse := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_mul := resize(to_unsigned(1, 1), 8);
     VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_right := to_unsigned(3, 2);
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_mul := resize(to_unsigned(1, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_k := VAR_k;
     VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_pc := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iffalse := result;
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_ptr := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_ptr := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_index := VAR_stack_index;
     VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse := t8;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l540_c11_683f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l543_c11_6f97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_phased_h_l548_c17_7638] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l548_c17_7638_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l546_c11_e723] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l537_c6_66c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l550_c11_e67d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l537_c6_66c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l540_c11_683f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l543_c11_6f97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l546_c11_e723_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l550_c11_e67d_return_output;
     VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_adjustment := VAR_CAST_TO_int8_t_uxn_opcodes_phased_h_l548_c17_7638_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l540_c7_cb81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l537_c1_eb9d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l550_c7_2814] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l550_c7_2814_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_cond;
     result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iftrue;
     result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output := result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l537_c1_eb9d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l550_c7_2814_return_output;
     -- set_will_fail[uxn_opcodes_phased_h_l538_c12_f3c1] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_sp;
     set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_k;
     set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_mul;
     set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output := set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l540_c1_1b4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l543_c7_3ed8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l546_c7_92bf] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond;
     result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue;
     result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output := result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l540_c1_1b4b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l538_c12_f3c1_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l543_c7_3ed8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond;
     result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue;
     result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output := result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l546_c7_92bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output;

     -- t_register[uxn_opcodes_phased_h_l541_c8_e87a] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l541_c8_e87a_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_index;
     t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output := t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l543_c1_337d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c7_92bf_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l543_c1_337d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue := VAR_t_register_uxn_opcodes_phased_h_l541_c8_e87a_return_output;
     -- t_register[uxn_opcodes_phased_h_l544_c8_34c5] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l544_c8_34c5_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_index;
     t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output := t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l540_c7_cb81] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond;
     result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue;
     result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output := result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l546_c1_99cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output;

     -- Submodule level 5
     VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output;
     VAR_set_uxn_opcodes_phased_h_l547_c3_1085_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l546_c1_99cf_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue := VAR_t_register_uxn_opcodes_phased_h_l544_c8_34c5_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l543_c7_3ed8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_cond;
     t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output := t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;

     -- pc_add_s8[uxn_opcodes_phased_h_l548_c3_a9b8] LATENCY=0
     -- Clock enable
     pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_CLOCK_ENABLE <= VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_CLOCK_ENABLE;
     -- Inputs
     pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_pc <= VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_pc;
     pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_adjustment <= VAR_pc_add_s8_uxn_opcodes_phased_h_l548_c3_a9b8_adjustment;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l537_c2_4dcc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond;
     result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue;
     result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output := result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output;

     -- set[uxn_opcodes_phased_h_l547_c3_1085] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l547_c3_1085_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l547_c3_1085_sp <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_sp;
     set_uxn_opcodes_phased_h_l547_c3_1085_stack_index <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_stack_index;
     set_uxn_opcodes_phased_h_l547_c3_1085_ins <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_ins;
     set_uxn_opcodes_phased_h_l547_c3_1085_k <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_k;
     set_uxn_opcodes_phased_h_l547_c3_1085_mul <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_mul;
     set_uxn_opcodes_phased_h_l547_c3_1085_add <= VAR_set_uxn_opcodes_phased_h_l547_c3_1085_add;
     -- Outputs

     -- Submodule level 6
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l543_c7_3ed8_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l540_c7_cb81] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_cond;
     t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output := t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;

     -- Submodule level 7
     VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l540_c7_cb81_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l537_c2_4dcc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_cond;
     t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output := t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output;

     -- Submodule level 8
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l537_c2_4dcc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
