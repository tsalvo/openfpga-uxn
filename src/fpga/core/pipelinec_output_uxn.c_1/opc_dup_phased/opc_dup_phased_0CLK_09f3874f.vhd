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
entity opc_dup_phased_0CLK_09f3874f is
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
end opc_dup_phased_0CLK_09f3874f;
architecture arch of opc_dup_phased_0CLK_09f3874f is
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
-- BIN_OP_EQ[uxn_opcodes_phased_h_l310_c6_7c67]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l310_c1_3879]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l313_c7_4eae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l310_c2_665e]
signal t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l310_c2_665e]
signal result_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l311_c12_50b4]
signal set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l313_c11_4aad]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l313_c1_64e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l316_c7_ebbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l313_c7_4eae]
signal t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l313_c7_4eae]
signal result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l314_c8_a086]
signal t_register_uxn_opcodes_phased_h_l314_c8_a086_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l316_c11_3b2b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l316_c1_4673]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l319_c7_7114]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l316_c7_ebbb]
signal t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l316_c7_ebbb]
signal result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l317_c8_5eae]
signal t_register_uxn_opcodes_phased_h_l317_c8_5eae_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l319_c11_b697]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l319_c1_16cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l322_c7_2aab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l319_c7_7114]
signal result_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l320_c3_b41a]
signal set_uxn_opcodes_phased_h_l320_c3_b41a_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l320_c3_b41a_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l320_c3_b41a_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l320_c3_b41a_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l320_c3_b41a_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l320_c3_b41a_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l320_c3_b41a_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l322_c11_cb99]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l322_c1_6922]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l325_c7_e1b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l322_c7_2aab]
signal result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l323_c3_1877]
signal put_stack_uxn_opcodes_phased_h_l323_c3_1877_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l323_c3_1877_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l323_c3_1877_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l323_c3_1877_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l323_c3_1877_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l325_c11_bc0e]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l325_c1_d9d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l325_c7_e1b6]
signal result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l326_c3_2597]
signal put_stack_uxn_opcodes_phased_h_l326_c3_2597_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l326_c3_2597_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l326_c3_2597_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l326_c3_2597_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l326_c3_2597_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l328_c11_bc02]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l328_c7_cf62]
signal result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67
BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l310_c2_665e
t8_MUX_uxn_opcodes_phased_h_l310_c2_665e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond,
t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue,
t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse,
t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l310_c2_665e
result_MUX_uxn_opcodes_phased_h_l310_c2_665e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond,
result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue,
result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse,
result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_sp,
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_k,
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_mul,
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_add,
set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad
BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae
t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond,
t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue,
t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse,
t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output);

-- result_MUX_uxn_opcodes_phased_h_l313_c7_4eae
result_MUX_uxn_opcodes_phased_h_l313_c7_4eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond,
result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue,
result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse,
result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output);

-- t_register_uxn_opcodes_phased_h_l314_c8_a086
t_register_uxn_opcodes_phased_h_l314_c8_a086 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l314_c8_a086_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_index,
t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_ptr,
t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b
BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb
t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond,
t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue,
t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse,
t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output);

-- result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb
result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond,
result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue,
result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse,
result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output);

-- t_register_uxn_opcodes_phased_h_l317_c8_5eae
t_register_uxn_opcodes_phased_h_l317_c8_5eae : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l317_c8_5eae_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_index,
t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_ptr,
t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697
BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output);

-- result_MUX_uxn_opcodes_phased_h_l319_c7_7114
result_MUX_uxn_opcodes_phased_h_l319_c7_7114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond,
result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue,
result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse,
result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output);

-- set_uxn_opcodes_phased_h_l320_c3_b41a
set_uxn_opcodes_phased_h_l320_c3_b41a : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l320_c3_b41a_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l320_c3_b41a_sp,
set_uxn_opcodes_phased_h_l320_c3_b41a_stack_index,
set_uxn_opcodes_phased_h_l320_c3_b41a_ins,
set_uxn_opcodes_phased_h_l320_c3_b41a_k,
set_uxn_opcodes_phased_h_l320_c3_b41a_mul,
set_uxn_opcodes_phased_h_l320_c3_b41a_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99
BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output);

-- result_MUX_uxn_opcodes_phased_h_l322_c7_2aab
result_MUX_uxn_opcodes_phased_h_l322_c7_2aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond,
result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue,
result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse,
result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output);

-- put_stack_uxn_opcodes_phased_h_l323_c3_1877
put_stack_uxn_opcodes_phased_h_l323_c3_1877 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l323_c3_1877_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l323_c3_1877_sp,
put_stack_uxn_opcodes_phased_h_l323_c3_1877_stack_index,
put_stack_uxn_opcodes_phased_h_l323_c3_1877_offset,
put_stack_uxn_opcodes_phased_h_l323_c3_1877_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e
BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output);

-- result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6
result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond,
result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue,
result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse,
result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output);

-- put_stack_uxn_opcodes_phased_h_l326_c3_2597
put_stack_uxn_opcodes_phased_h_l326_c3_2597 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l326_c3_2597_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l326_c3_2597_sp,
put_stack_uxn_opcodes_phased_h_l326_c3_2597_stack_index,
put_stack_uxn_opcodes_phased_h_l326_c3_2597_offset,
put_stack_uxn_opcodes_phased_h_l326_c3_2597_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02
BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output);

-- result_MUX_uxn_opcodes_phased_h_l328_c7_cf62
result_MUX_uxn_opcodes_phased_h_l328_c7_cf62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_cond,
result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iftrue,
result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iffalse,
result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output);



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
 BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output,
 t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output,
 result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output,
 set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output,
 t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output,
 result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output,
 t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output,
 t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output,
 result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output,
 t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output,
 result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output,
 result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output,
 result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output,
 result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_cond : unsigned(0 downto 0);
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
     VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_right := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_add := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_right := to_unsigned(5, 3);
     VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_offset := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_right := to_unsigned(3, 2);
     VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_offset := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_right := to_unsigned(1, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_mul := resize(to_unsigned(1, 1), 8);
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_mul := resize(to_unsigned(1, 1), 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iffalse := result;
     VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_sp := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_ptr := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_ptr := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_value := t8;
     VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_value := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l310_c6_7c67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l313_c11_4aad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l328_c11_bc02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l322_c11_cb99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l325_c11_bc0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l316_c11_3b2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l319_c11_b697] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l310_c6_7c67_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l313_c11_4aad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l316_c11_3b2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l319_c11_b697_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l322_c11_cb99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l325_c11_bc0e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l328_c11_bc02_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l328_c7_cf62] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_cond;
     result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iftrue;
     result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output := result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l310_c1_3879] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l313_c7_4eae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l310_c1_3879_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l328_c7_cf62_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l316_c7_ebbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l311_c12_50b4] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_sp;
     set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_k;
     set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_mul;
     set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output := set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l313_c1_64e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l325_c7_e1b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond;
     result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue;
     result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output := result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l313_c1_64e7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l311_c12_50b4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l316_c1_4673] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l319_c7_7114] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output;

     -- t_register[uxn_opcodes_phased_h_l314_c8_a086] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l314_c8_a086_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_index;
     t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output := t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l322_c7_2aab] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond;
     result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue;
     result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output := result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l316_c1_4673_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue := VAR_t_register_uxn_opcodes_phased_h_l314_c8_a086_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l322_c7_2aab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l319_c1_16cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l319_c7_7114] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_cond;
     result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iftrue;
     result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output := result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output;

     -- t_register[uxn_opcodes_phased_h_l317_c8_5eae] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l317_c8_5eae_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_index;
     t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output := t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c7_2aab_return_output;
     VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l319_c1_16cc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l319_c7_7114_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue := VAR_t_register_uxn_opcodes_phased_h_l317_c8_5eae_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l316_c7_ebbb] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond;
     result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue;
     result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output := result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;

     -- set[uxn_opcodes_phased_h_l320_c3_b41a] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l320_c3_b41a_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l320_c3_b41a_sp <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_sp;
     set_uxn_opcodes_phased_h_l320_c3_b41a_stack_index <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_stack_index;
     set_uxn_opcodes_phased_h_l320_c3_b41a_ins <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_ins;
     set_uxn_opcodes_phased_h_l320_c3_b41a_k <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_k;
     set_uxn_opcodes_phased_h_l320_c3_b41a_mul <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_mul;
     set_uxn_opcodes_phased_h_l320_c3_b41a_add <= VAR_set_uxn_opcodes_phased_h_l320_c3_b41a_add;
     -- Outputs

     -- t8_MUX[uxn_opcodes_phased_h_l316_c7_ebbb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_cond;
     t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output := t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l322_c1_6922] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l325_c7_e1b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c7_e1b6_return_output;
     VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l322_c1_6922_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l316_c7_ebbb_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l313_c7_4eae] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond;
     result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue;
     result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output := result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l313_c7_4eae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_cond;
     t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output := t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;

     -- put_stack[uxn_opcodes_phased_h_l323_c3_1877] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l323_c3_1877_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l323_c3_1877_sp <= VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_sp;
     put_stack_uxn_opcodes_phased_h_l323_c3_1877_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_stack_index;
     put_stack_uxn_opcodes_phased_h_l323_c3_1877_offset <= VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_offset;
     put_stack_uxn_opcodes_phased_h_l323_c3_1877_value <= VAR_put_stack_uxn_opcodes_phased_h_l323_c3_1877_value;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l325_c1_d9d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output;

     -- Submodule level 7
     VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l325_c1_d9d8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l313_c7_4eae_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l310_c2_665e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond;
     t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output := t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l310_c2_665e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_cond;
     result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output := result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output;

     -- put_stack[uxn_opcodes_phased_h_l326_c3_2597] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l326_c3_2597_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l326_c3_2597_sp <= VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_sp;
     put_stack_uxn_opcodes_phased_h_l326_c3_2597_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_stack_index;
     put_stack_uxn_opcodes_phased_h_l326_c3_2597_offset <= VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_offset;
     put_stack_uxn_opcodes_phased_h_l326_c3_2597_value <= VAR_put_stack_uxn_opcodes_phased_h_l326_c3_2597_value;
     -- Outputs

     -- Submodule level 8
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l310_c2_665e_return_output;
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
