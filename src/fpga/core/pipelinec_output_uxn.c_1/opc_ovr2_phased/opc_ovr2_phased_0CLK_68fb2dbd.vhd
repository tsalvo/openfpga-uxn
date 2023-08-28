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
-- Submodules: 70
entity opc_ovr2_phased_0CLK_68fb2dbd is
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
end opc_ovr2_phased_0CLK_68fb2dbd;
architecture arch of opc_ovr2_phased_0CLK_68fb2dbd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l376_c6_9fa1]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l376_c1_fca6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l379_c7_b67f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l376_c2_3e35]
signal t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_phased_h_l376_c2_3e35]
signal n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l376_c2_3e35]
signal result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l377_c12_be5c]
signal set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l379_c11_87ef]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l379_c1_36c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l382_c7_0acc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l379_c7_b67f]
signal t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_phased_h_l379_c7_b67f]
signal n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l379_c7_b67f]
signal result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(0 downto 0);

-- t2_register[uxn_opcodes_phased_h_l380_c9_7d2e]
signal t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_CLOCK_ENABLE : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_index : unsigned(0 downto 0);
signal t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_ptr : unsigned(7 downto 0);
signal t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l382_c11_584b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l382_c1_700d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l385_c7_59cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_phased_h_l382_c7_0acc]
signal t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_phased_h_l382_c7_0acc]
signal n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l382_c7_0acc]
signal result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(0 downto 0);

-- n2_register[uxn_opcodes_phased_h_l383_c9_68dd]
signal n2_register_uxn_opcodes_phased_h_l383_c9_68dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_ptr : unsigned(7 downto 0);
signal n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l385_c11_537a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l385_c1_562e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l388_c7_6b01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_phased_h_l385_c7_59cc]
signal n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l385_c7_59cc]
signal result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output : unsigned(0 downto 0);

-- n2_register[uxn_opcodes_phased_h_l386_c9_c5f4]
signal n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_index : unsigned(0 downto 0);
signal n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_ptr : unsigned(7 downto 0);
signal n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l388_c11_4bc2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l388_c1_75be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l391_c7_fe36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l388_c7_6b01]
signal result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_phased_h_l389_c31_489d]
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l389_c3_8393]
signal stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l391_c11_ea8c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l391_c1_8512]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l394_c7_192d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l391_c7_fe36]
signal result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_phased_h_l392_c31_2dd8]
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_right : unsigned(0 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l392_c3_fd94]
signal stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l394_c11_40d8]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l394_c1_5f42]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l397_c7_f4b3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l394_c7_192d]
signal result_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_phased_h_l395_c31_89ba]
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_phased_h_l395_c49_6077]
signal CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l395_c3_1325]
signal stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l397_c11_2168]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l397_c1_2508]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l400_c7_5485]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l397_c7_f4b3]
signal result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_phased_h_l398_c31_f9db]
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_right : unsigned(1 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l398_c3_71d9]
signal stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l400_c11_32a4]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l400_c1_dca4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l403_c7_32b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l400_c7_5485]
signal result_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_phased_h_l401_c31_9c73]
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l401_c3_0962]
signal stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l403_c11_94d8]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l403_c1_118f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l403_c7_32b9]
signal result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_phased_h_l404_c31_13db]
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output : unsigned(7 downto 0);

-- stack_data_set[uxn_opcodes_phased_h_l404_c3_24e2]
signal stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_address : unsigned(7 downto 0);
signal stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l406_c11_8167]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l406_c7_4819]
signal result_MUX_uxn_opcodes_phased_h_l406_c7_4819_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345
signal CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1
BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35
t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond,
t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue,
t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse,
t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output);

-- n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35
n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond,
n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue,
n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse,
n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output);

-- result_MUX_uxn_opcodes_phased_h_l376_c2_3e35
result_MUX_uxn_opcodes_phased_h_l376_c2_3e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond,
result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue,
result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse,
result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_sp,
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_k,
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_mul,
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_add,
set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef
BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f
t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond,
t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue,
t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse,
t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output);

-- n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f
n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond,
n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue,
n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse,
n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output);

-- result_MUX_uxn_opcodes_phased_h_l379_c7_b67f
result_MUX_uxn_opcodes_phased_h_l379_c7_b67f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond,
result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue,
result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse,
result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output);

-- t2_register_uxn_opcodes_phased_h_l380_c9_7d2e
t2_register_uxn_opcodes_phased_h_l380_c9_7d2e : entity work.t2_register_0CLK_a2cd5ea9 port map (
clk,
t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_CLOCK_ENABLE,
t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_index,
t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_ptr,
t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b
BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output);

-- t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc
t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond,
t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue,
t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse,
t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output);

-- n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc
n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond,
n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue,
n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse,
n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output);

-- result_MUX_uxn_opcodes_phased_h_l382_c7_0acc
result_MUX_uxn_opcodes_phased_h_l382_c7_0acc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond,
result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue,
result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse,
result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output);

-- n2_register_uxn_opcodes_phased_h_l383_c9_68dd
n2_register_uxn_opcodes_phased_h_l383_c9_68dd : entity work.n2_register_0CLK_a2cd5ea9 port map (
clk,
n2_register_uxn_opcodes_phased_h_l383_c9_68dd_CLOCK_ENABLE,
n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_index,
n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_ptr,
n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a
BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output);

-- n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc
n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond,
n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue,
n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse,
n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output);

-- result_MUX_uxn_opcodes_phased_h_l385_c7_59cc
result_MUX_uxn_opcodes_phased_h_l385_c7_59cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond,
result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue,
result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse,
result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output);

-- n2_register_uxn_opcodes_phased_h_l386_c9_c5f4
n2_register_uxn_opcodes_phased_h_l386_c9_c5f4 : entity work.n2_register_0CLK_a2cd5ea9 port map (
clk,
n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_CLOCK_ENABLE,
n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_index,
n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_ptr,
n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2
BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output);

-- result_MUX_uxn_opcodes_phased_h_l388_c7_6b01
result_MUX_uxn_opcodes_phased_h_l388_c7_6b01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond,
result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue,
result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse,
result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output);

-- BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d
BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_left,
BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_right,
BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l389_c3_8393
stack_data_set_uxn_opcodes_phased_h_l389_c3_8393 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_stack_index,
stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_address,
stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c
BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output);

-- result_MUX_uxn_opcodes_phased_h_l391_c7_fe36
result_MUX_uxn_opcodes_phased_h_l391_c7_fe36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond,
result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue,
result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse,
result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output);

-- BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8
BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8 : entity work.BIN_OP_MINUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_left,
BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_right,
BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94
stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_stack_index,
stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_address,
stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8
BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output);

-- result_MUX_uxn_opcodes_phased_h_l394_c7_192d
result_MUX_uxn_opcodes_phased_h_l394_c7_192d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond,
result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue,
result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse,
result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba
BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_left,
BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_right,
BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output);

-- CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077
CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_x,
CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l395_c3_1325
stack_data_set_uxn_opcodes_phased_h_l395_c3_1325 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_stack_index,
stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_address,
stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168
BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output);

-- result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3
result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond,
result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue,
result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse,
result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output);

-- BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db
BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db : entity work.BIN_OP_MINUS_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_left,
BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_right,
BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9
stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_stack_index,
stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_address,
stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4
BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output);

-- result_MUX_uxn_opcodes_phased_h_l400_c7_5485
result_MUX_uxn_opcodes_phased_h_l400_c7_5485 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond,
result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue,
result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse,
result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output);

-- BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73
BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_left,
BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_right,
BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l401_c3_0962
stack_data_set_uxn_opcodes_phased_h_l401_c3_0962 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_stack_index,
stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_address,
stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8
BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output);

-- result_MUX_uxn_opcodes_phased_h_l403_c7_32b9
result_MUX_uxn_opcodes_phased_h_l403_c7_32b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond,
result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue,
result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse,
result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output);

-- BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db
BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_left,
BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_right,
BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output);

-- stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2
stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2 : entity work.stack_data_set_0CLK_a5a1cd4e port map (
stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_CLOCK_ENABLE,
stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_stack_index,
stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_address,
stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167
BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output);

-- result_MUX_uxn_opcodes_phased_h_l406_c7_4819
result_MUX_uxn_opcodes_phased_h_l406_c7_4819 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l406_c7_4819_cond,
result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iftrue,
result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iffalse,
result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345
CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_x,
CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output);



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
 n16,
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output,
 t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output,
 n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output,
 result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output,
 set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output,
 t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output,
 n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output,
 result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output,
 t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output,
 t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output,
 n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output,
 result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output,
 n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output,
 n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output,
 result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output,
 n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output,
 result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output,
 BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output,
 result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output,
 BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output,
 result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output,
 BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output,
 CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output,
 result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output,
 BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output,
 result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output,
 BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output,
 result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output,
 BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output,
 result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_index : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_ptr : unsigned(7 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_ptr : unsigned(7 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_index : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_ptr : unsigned(7 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l395_c39_c22f_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l398_c39_2afe_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_address : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l389_l401_DUPLICATE_ef95_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l404_l392_DUPLICATE_7d06_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16 := n16;
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_right := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iffalse := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_add := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_right := to_unsigned(5, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_right := to_unsigned(6, 3);
     VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_mul := resize(to_unsigned(4, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_right := to_unsigned(6, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_right := to_unsigned(7, 3);
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_right := to_unsigned(10, 4);
     VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_right := to_unsigned(9, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_right := to_unsigned(2, 2);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_k := VAR_k;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_x := n16;
     VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iffalse := result;
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_left := VAR_sp;
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_left := VAR_sp;
     VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_ptr := VAR_sp;
     VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_ptr := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_sp := VAR_sp;
     VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_ptr := VAR_sp;
     VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_index := VAR_stack_index;
     VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_stack_index := VAR_stack_index;
     VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_index := VAR_stack_index;
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_x := t16;
     VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse := t16;
     REG_VAR_tmp8 := tmp8;
     -- BIN_OP_MINUS[uxn_opcodes_phased_h_l395_c31_89ba] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_left <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_left;
     BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_right <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output := BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l400_c11_32a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l397_c11_2168] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_phased_h_l392_c31_2dd8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_left <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_left;
     BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_right <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output := BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l379_c11_87ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l404_l392_DUPLICATE_7d06 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l404_l392_DUPLICATE_7d06_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l382_c11_584b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_phased_h_l398_c31_f9db] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_left <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_left;
     BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_right <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output := BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l406_c11_8167] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l391_c11_ea8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l388_c11_4bc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output := CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l376_c6_9fa1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_phased_h_l398_c39_2afe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l398_c39_2afe_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l394_c11_40d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output;

     -- CONST_SR_8[uxn_opcodes_phased_h_l395_c49_6077] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_x <= VAR_CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output := CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l403_c11_94d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l385_c11_537a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_phased_h_l401_c31_9c73] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_left <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_left;
     BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_right <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output := BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_phased_h_l404_c31_13db] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_left <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_left;
     BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_right <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output := BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_phased_h_l389_c31_489d] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_left <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_left;
     BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_right <= VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output := BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l376_c6_9fa1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l379_c11_87ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l382_c11_584b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l385_c11_537a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l388_c11_4bc2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l391_c11_ea8c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l394_c11_40d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l397_c11_2168_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l400_c11_32a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l403_c11_94d8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l406_c11_8167_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_address := VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l389_c31_489d_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_address := VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l392_c31_2dd8_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_address := VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l395_c31_89ba_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_address := VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l398_c31_f9db_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_address := VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l401_c31_9c73_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_address := VAR_BIN_OP_MINUS_uxn_opcodes_phased_h_l404_c31_13db_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_value := VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l398_c39_2afe_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_value := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l404_l392_DUPLICATE_7d06_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_value := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l404_l392_DUPLICATE_7d06_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_phased_h_l395_c39_c22f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l395_c39_c22f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l395_c49_6077_return_output);

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l389_l401_DUPLICATE_ef95 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l389_l401_DUPLICATE_ef95_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_phased_h_l401_l389_DUPLICATE_3345_return_output);

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l379_c7_b67f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l406_c7_4819] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l406_c7_4819_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_cond;
     result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iftrue;
     result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output := result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l376_c1_fca6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output;

     -- Submodule level 2
     VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_value := VAR_CAST_TO_uint8_t_uxn_opcodes_phased_h_l395_c39_c22f_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_value := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l389_l401_DUPLICATE_ef95_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_value := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_phased_h_l389_l401_DUPLICATE_ef95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l376_c1_fca6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l406_c7_4819_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l379_c1_36c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l382_c7_0acc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l403_c7_32b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond;
     result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue;
     result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output := result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l377_c12_be5c] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_sp;
     set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_k;
     set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_mul;
     set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output := set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;
     VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l379_c1_36c6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l377_c12_be5c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l385_c7_59cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;

     -- t2_register[uxn_opcodes_phased_h_l380_c9_7d2e] LATENCY=0
     -- Clock enable
     t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_CLOCK_ENABLE <= VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_CLOCK_ENABLE;
     -- Inputs
     t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_index <= VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_index;
     t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_ptr <= VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_stack_ptr;
     -- Outputs
     VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output := t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l382_c1_700d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l400_c7_5485] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond;
     result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue;
     result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output := result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;
     VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l382_c1_700d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue := VAR_t2_register_uxn_opcodes_phased_h_l380_c9_7d2e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l397_c7_f4b3] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond;
     result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue;
     result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output := result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output;

     -- n2_register[uxn_opcodes_phased_h_l383_c9_68dd] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_phased_h_l383_c9_68dd_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_index <= VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_index;
     n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_ptr <= VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_stack_ptr;
     -- Outputs
     VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output := n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l388_c7_6b01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l385_c1_562e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output;
     VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l385_c1_562e_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue := VAR_n2_register_uxn_opcodes_phased_h_l383_c9_68dd_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l391_c7_fe36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output;

     -- n2_register[uxn_opcodes_phased_h_l386_c9_c5f4] LATENCY=0
     -- Clock enable
     n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_CLOCK_ENABLE <= VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_CLOCK_ENABLE;
     -- Inputs
     n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_index <= VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_index;
     n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_ptr <= VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_stack_ptr;
     -- Outputs
     VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output := n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l388_c1_75be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l394_c7_192d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond;
     result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue;
     result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output := result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output;

     -- t16_MUX[uxn_opcodes_phased_h_l382_c7_0acc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond;
     t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output := t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l388_c1_75be_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue := VAR_n2_register_uxn_opcodes_phased_h_l386_c9_c5f4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse := VAR_t16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l391_c1_8512] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l391_c7_fe36] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_cond;
     result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iftrue;
     result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output := result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l389_c3_8393] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_address;
     stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l389_c3_8393_value;
     -- Outputs

     -- n16_MUX[uxn_opcodes_phased_h_l385_c7_59cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond <= VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond;
     n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue <= VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue;
     n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse <= VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output := n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l394_c7_192d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output;

     -- t16_MUX[uxn_opcodes_phased_h_l379_c7_b67f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond;
     t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output := t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c7_192d_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l391_c1_8512_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse := VAR_n16_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l391_c7_fe36_return_output;
     VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse := VAR_t16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l394_c1_5f42] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l397_c7_f4b3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l388_c7_6b01] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_cond;
     result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iftrue;
     result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output := result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output;

     -- t16_MUX[uxn_opcodes_phased_h_l376_c2_3e35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond <= VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond;
     t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue <= VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue;
     t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse <= VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output := t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;

     -- n16_MUX[uxn_opcodes_phased_h_l382_c7_0acc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond <= VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond;
     n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue <= VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue;
     n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse <= VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output := n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l392_c3_fd94] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_address;
     stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l392_c3_fd94_value;
     -- Outputs

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c7_f4b3_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l394_c1_5f42_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse := VAR_n16_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l388_c7_6b01_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l397_c1_2508] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l395_c3_1325] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_address;
     stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l395_c3_1325_value;
     -- Outputs

     -- n16_MUX[uxn_opcodes_phased_h_l379_c7_b67f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond <= VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond;
     n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue <= VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue;
     n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse <= VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output := n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l385_c7_59cc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_cond;
     result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iftrue;
     result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output := result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l400_c7_5485] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c7_5485_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l397_c1_2508_return_output;
     VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse := VAR_n16_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l385_c7_59cc_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l382_c7_0acc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_cond;
     result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iftrue;
     result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output := result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l398_c3_71d9] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_address;
     stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l398_c3_71d9_value;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l403_c7_32b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output;

     -- n16_MUX[uxn_opcodes_phased_h_l376_c2_3e35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond <= VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond;
     n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue <= VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue;
     n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse <= VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output := n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l400_c1_dca4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c7_32b9_return_output;
     VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l400_c1_dca4_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l382_c7_0acc_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l379_c7_b67f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_cond;
     result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iftrue;
     result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output := result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;

     -- stack_data_set[uxn_opcodes_phased_h_l401_c3_0962] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_address;
     stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l401_c3_0962_value;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l403_c1_118f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output;

     -- Submodule level 11
     VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l403_c1_118f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l379_c7_b67f_return_output;
     -- stack_data_set[uxn_opcodes_phased_h_l404_c3_24e2] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_CLOCK_ENABLE <= VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_stack_index <= VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_stack_index;
     stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_address <= VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_address;
     stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_value <= VAR_stack_data_set_uxn_opcodes_phased_h_l404_c3_24e2_value;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l376_c2_3e35] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_cond;
     result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iftrue;
     result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output := result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l376_c2_3e35_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16 <= REG_COMB_n16;
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
