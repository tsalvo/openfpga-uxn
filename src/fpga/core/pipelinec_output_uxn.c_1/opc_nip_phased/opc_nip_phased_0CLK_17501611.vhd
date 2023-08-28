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
-- Submodules: 29
entity opc_nip_phased_0CLK_17501611 is
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
end opc_nip_phased_0CLK_17501611;
architecture arch of opc_nip_phased_0CLK_17501611 is
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
-- BIN_OP_EQ[uxn_opcodes_phased_h_l211_c6_0578]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l211_c1_18c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l214_c7_7c62]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l211_c2_1077]
signal t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l211_c2_1077]
signal result_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l212_c12_3a24]
signal set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l214_c11_033a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l214_c1_f7d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l217_c7_7669]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l214_c7_7c62]
signal t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l214_c7_7c62]
signal result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l215_c8_226e]
signal t_register_uxn_opcodes_phased_h_l215_c8_226e_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l217_c11_4eda]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l217_c1_6897]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l220_c7_7d9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l217_c7_7669]
signal t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l217_c7_7669]
signal result_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l218_c8_dba3]
signal t_register_uxn_opcodes_phased_h_l218_c8_dba3_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l220_c11_10ec]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l220_c1_4f2e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l223_c7_7c87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l220_c7_7d9e]
signal result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l221_c3_fbef]
signal set_uxn_opcodes_phased_h_l221_c3_fbef_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l221_c3_fbef_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l221_c3_fbef_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l221_c3_fbef_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l221_c3_fbef_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l221_c3_fbef_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l221_c3_fbef_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l223_c11_d275]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l223_c1_6554]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l223_c7_7c87]
signal result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l224_c3_0bd4]
signal put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l226_c11_df2c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l226_c7_6708]
signal result_MUX_uxn_opcodes_phased_h_l226_c7_6708_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578
BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l211_c2_1077
t8_MUX_uxn_opcodes_phased_h_l211_c2_1077 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond,
t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue,
t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse,
t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output);

-- result_MUX_uxn_opcodes_phased_h_l211_c2_1077
result_MUX_uxn_opcodes_phased_h_l211_c2_1077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond,
result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue,
result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse,
result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_sp,
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_k,
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_mul,
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_add,
set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a
BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62
t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond,
t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue,
t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse,
t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output);

-- result_MUX_uxn_opcodes_phased_h_l214_c7_7c62
result_MUX_uxn_opcodes_phased_h_l214_c7_7c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond,
result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue,
result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse,
result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output);

-- t_register_uxn_opcodes_phased_h_l215_c8_226e
t_register_uxn_opcodes_phased_h_l215_c8_226e : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l215_c8_226e_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_index,
t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_ptr,
t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda
BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l217_c7_7669
t8_MUX_uxn_opcodes_phased_h_l217_c7_7669 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond,
t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue,
t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse,
t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output);

-- result_MUX_uxn_opcodes_phased_h_l217_c7_7669
result_MUX_uxn_opcodes_phased_h_l217_c7_7669 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond,
result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue,
result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse,
result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output);

-- t_register_uxn_opcodes_phased_h_l218_c8_dba3
t_register_uxn_opcodes_phased_h_l218_c8_dba3 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l218_c8_dba3_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_index,
t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_ptr,
t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec
BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output);

-- result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e
result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond,
result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue,
result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse,
result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output);

-- set_uxn_opcodes_phased_h_l221_c3_fbef
set_uxn_opcodes_phased_h_l221_c3_fbef : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l221_c3_fbef_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l221_c3_fbef_sp,
set_uxn_opcodes_phased_h_l221_c3_fbef_stack_index,
set_uxn_opcodes_phased_h_l221_c3_fbef_ins,
set_uxn_opcodes_phased_h_l221_c3_fbef_k,
set_uxn_opcodes_phased_h_l221_c3_fbef_mul,
set_uxn_opcodes_phased_h_l221_c3_fbef_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275
BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output);

-- result_MUX_uxn_opcodes_phased_h_l223_c7_7c87
result_MUX_uxn_opcodes_phased_h_l223_c7_7c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond,
result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue,
result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse,
result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output);

-- put_stack_uxn_opcodes_phased_h_l224_c3_0bd4
put_stack_uxn_opcodes_phased_h_l224_c3_0bd4 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_sp,
put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_stack_index,
put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_offset,
put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c
BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l226_c7_6708
result_MUX_uxn_opcodes_phased_h_l226_c7_6708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l226_c7_6708_cond,
result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iftrue,
result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iffalse,
result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output);



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
 BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output,
 t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output,
 result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output,
 set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output,
 t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output,
 result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output,
 t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output,
 t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output,
 result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output,
 t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output,
 result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output,
 result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output,
 result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_cond : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iftrue := to_unsigned(1, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_mul := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_add := resize(to_signed(-1, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iffalse := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_mul := resize(to_unsigned(2, 2), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_right := to_unsigned(1, 1);
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_add := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_right := to_unsigned(2, 2);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iffalse := result;
     VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_ptr := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_ptr := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_value := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l211_c6_0578] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l226_c11_df2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l220_c11_10ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l217_c11_4eda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l223_c11_d275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l214_c11_033a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l211_c6_0578_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l214_c11_033a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l217_c11_4eda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l220_c11_10ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l223_c11_d275_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l226_c11_df2c_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l226_c7_6708] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l226_c7_6708_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_cond;
     result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iftrue;
     result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output := result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l211_c1_18c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l214_c7_7c62] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l211_c1_18c8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l226_c7_6708_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l214_c1_f7d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l212_c12_3a24] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_sp;
     set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_k;
     set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_mul;
     set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output := set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l223_c7_7c87] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond;
     result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue;
     result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output := result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l217_c7_7669] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l214_c1_f7d3_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l212_c12_3a24_return_output;
     -- t_register[uxn_opcodes_phased_h_l215_c8_226e] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l215_c8_226e_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_index;
     t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output := t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l220_c7_7d9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l220_c7_7d9e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_cond;
     result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output := result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l217_c1_6897] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l217_c1_6897_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l220_c7_7d9e_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue := VAR_t_register_uxn_opcodes_phased_h_l215_c8_226e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l217_c7_7669] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond;
     result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue;
     result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output := result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l220_c1_4f2e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l223_c7_7c87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output;

     -- t_register[uxn_opcodes_phased_h_l218_c8_dba3] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l218_c8_dba3_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_index;
     t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output := t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c7_7c87_return_output;
     VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l220_c1_4f2e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue := VAR_t_register_uxn_opcodes_phased_h_l218_c8_dba3_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l214_c7_7c62] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond;
     result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue;
     result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output := result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l217_c7_7669] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_cond;
     t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output := t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;

     -- set[uxn_opcodes_phased_h_l221_c3_fbef] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l221_c3_fbef_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l221_c3_fbef_sp <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_sp;
     set_uxn_opcodes_phased_h_l221_c3_fbef_stack_index <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_stack_index;
     set_uxn_opcodes_phased_h_l221_c3_fbef_ins <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_ins;
     set_uxn_opcodes_phased_h_l221_c3_fbef_k <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_k;
     set_uxn_opcodes_phased_h_l221_c3_fbef_mul <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_mul;
     set_uxn_opcodes_phased_h_l221_c3_fbef_add <= VAR_set_uxn_opcodes_phased_h_l221_c3_fbef_add;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l223_c1_6554] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output;

     -- Submodule level 6
     VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l223_c1_6554_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l217_c7_7669_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l211_c2_1077] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond;
     result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue;
     result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output := result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l214_c7_7c62] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_cond;
     t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output := t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;

     -- put_stack[uxn_opcodes_phased_h_l224_c3_0bd4] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_sp <= VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_sp;
     put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_stack_index;
     put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_offset <= VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_offset;
     put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_value <= VAR_put_stack_uxn_opcodes_phased_h_l224_c3_0bd4_value;
     -- Outputs

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l214_c7_7c62_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l211_c2_1077] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_cond;
     t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output := t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output;

     -- Submodule level 8
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l211_c2_1077_return_output;
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
