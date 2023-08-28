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
-- Submodules: 58
entity opc_rot_phased_0CLK_ba4ef5fd is
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
end opc_rot_phased_0CLK_ba4ef5fd;
architecture arch of opc_rot_phased_0CLK_ba4ef5fd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l271_c6_d0d8]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l271_c1_1cc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l274_c7_841b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l271_c2_af4e]
signal t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l271_c2_af4e]
signal n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l271_c2_af4e]
signal result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l271_c2_af4e]
signal l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(7 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l272_c12_eab8]
signal set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l274_c11_c09d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l274_c1_dbcc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l277_c7_c7b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l274_c7_841b]
signal t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l274_c7_841b]
signal n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l274_c7_841b]
signal result_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l274_c7_841b]
signal l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(7 downto 0);

-- t_register[uxn_opcodes_phased_h_l275_c8_8860]
signal t_register_uxn_opcodes_phased_h_l275_c8_8860_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l277_c11_846c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l277_c1_b254]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l280_c7_23ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l277_c7_c7b9]
signal t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l277_c7_c7b9]
signal n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l277_c7_c7b9]
signal result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l277_c7_c7b9]
signal l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(7 downto 0);

-- n_register[uxn_opcodes_phased_h_l278_c8_9aba]
signal n_register_uxn_opcodes_phased_h_l278_c8_9aba_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l280_c11_c336]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l280_c1_ffba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l283_c7_64b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l280_c7_23ad]
signal n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l280_c7_23ad]
signal result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l280_c7_23ad]
signal l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(7 downto 0);

-- l_register[uxn_opcodes_phased_h_l281_c8_5cc4]
signal l_register_uxn_opcodes_phased_h_l281_c8_5cc4_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_ptr : unsigned(7 downto 0);
signal l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l283_c11_171c]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l283_c1_ca6d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l286_c7_2c35]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l283_c7_64b2]
signal result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l283_c7_64b2]
signal l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output : unsigned(7 downto 0);

-- l_register[uxn_opcodes_phased_h_l284_c8_25d0]
signal l_register_uxn_opcodes_phased_h_l284_c8_25d0_CLOCK_ENABLE : unsigned(0 downto 0);
signal l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_index : unsigned(0 downto 0);
signal l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_ptr : unsigned(7 downto 0);
signal l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l286_c11_05d1]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l286_c1_838b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l289_c7_dcf0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l286_c7_2c35]
signal result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l287_c3_7b8f]
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l287_c3_7b8f_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l289_c11_6697]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l289_c1_6ed5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l292_c7_c263]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l289_c7_dcf0]
signal result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l290_c3_e334]
signal put_stack_uxn_opcodes_phased_h_l290_c3_e334_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l290_c3_e334_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l290_c3_e334_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l290_c3_e334_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l290_c3_e334_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l292_c11_6c6b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l292_c1_9091]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l295_c7_660e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l292_c7_c263]
signal result_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l293_c3_70be]
signal put_stack_uxn_opcodes_phased_h_l293_c3_70be_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l293_c3_70be_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l293_c3_70be_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l293_c3_70be_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l293_c3_70be_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l295_c11_568f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l295_c1_2f86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l295_c7_660e]
signal result_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output : unsigned(0 downto 0);

-- put_stack[uxn_opcodes_phased_h_l296_c3_eb4e]
signal put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_sp : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_offset : unsigned(7 downto 0);
signal put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l298_c11_c23d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l298_c7_8836]
signal result_MUX_uxn_opcodes_phased_h_l298_c7_8836_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8
BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e
t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond,
t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue,
t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse,
t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e
n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond,
n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue,
n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse,
n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l271_c2_af4e
result_MUX_uxn_opcodes_phased_h_l271_c2_af4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond,
result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue,
result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse,
result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e
l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond,
l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue,
l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse,
l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_sp,
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_k,
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_mul,
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_add,
set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d
BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l274_c7_841b
t8_MUX_uxn_opcodes_phased_h_l274_c7_841b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond,
t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue,
t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse,
t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l274_c7_841b
n8_MUX_uxn_opcodes_phased_h_l274_c7_841b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond,
n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue,
n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse,
n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output);

-- result_MUX_uxn_opcodes_phased_h_l274_c7_841b
result_MUX_uxn_opcodes_phased_h_l274_c7_841b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond,
result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue,
result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse,
result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l274_c7_841b
l8_MUX_uxn_opcodes_phased_h_l274_c7_841b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond,
l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue,
l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse,
l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output);

-- t_register_uxn_opcodes_phased_h_l275_c8_8860
t_register_uxn_opcodes_phased_h_l275_c8_8860 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l275_c8_8860_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_index,
t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_ptr,
t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c
BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9
t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond,
t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue,
t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse,
t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9
n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond,
n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue,
n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse,
n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output);

-- result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9
result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond,
result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue,
result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse,
result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9
l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond,
l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue,
l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse,
l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output);

-- n_register_uxn_opcodes_phased_h_l278_c8_9aba
n_register_uxn_opcodes_phased_h_l278_c8_9aba : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l278_c8_9aba_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_index,
n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_ptr,
n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336
BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad
n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond,
n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue,
n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse,
n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output);

-- result_MUX_uxn_opcodes_phased_h_l280_c7_23ad
result_MUX_uxn_opcodes_phased_h_l280_c7_23ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond,
result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue,
result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse,
result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad
l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond,
l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue,
l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse,
l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output);

-- l_register_uxn_opcodes_phased_h_l281_c8_5cc4
l_register_uxn_opcodes_phased_h_l281_c8_5cc4 : entity work.l_register_0CLK_621d5f60 port map (
clk,
l_register_uxn_opcodes_phased_h_l281_c8_5cc4_CLOCK_ENABLE,
l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_index,
l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_ptr,
l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c
BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output);

-- result_MUX_uxn_opcodes_phased_h_l283_c7_64b2
result_MUX_uxn_opcodes_phased_h_l283_c7_64b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond,
result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue,
result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse,
result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2
l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond,
l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue,
l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse,
l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output);

-- l_register_uxn_opcodes_phased_h_l284_c8_25d0
l_register_uxn_opcodes_phased_h_l284_c8_25d0 : entity work.l_register_0CLK_621d5f60 port map (
clk,
l_register_uxn_opcodes_phased_h_l284_c8_25d0_CLOCK_ENABLE,
l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_index,
l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_ptr,
l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1
BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output);

-- result_MUX_uxn_opcodes_phased_h_l286_c7_2c35
result_MUX_uxn_opcodes_phased_h_l286_c7_2c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond,
result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue,
result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse,
result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output);

-- set_uxn_opcodes_phased_h_l287_c3_7b8f
set_uxn_opcodes_phased_h_l287_c3_7b8f : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l287_c3_7b8f_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l287_c3_7b8f_sp,
set_uxn_opcodes_phased_h_l287_c3_7b8f_stack_index,
set_uxn_opcodes_phased_h_l287_c3_7b8f_ins,
set_uxn_opcodes_phased_h_l287_c3_7b8f_k,
set_uxn_opcodes_phased_h_l287_c3_7b8f_mul,
set_uxn_opcodes_phased_h_l287_c3_7b8f_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697
BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output);

-- result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0
result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond,
result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue,
result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse,
result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output);

-- put_stack_uxn_opcodes_phased_h_l290_c3_e334
put_stack_uxn_opcodes_phased_h_l290_c3_e334 : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l290_c3_e334_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l290_c3_e334_sp,
put_stack_uxn_opcodes_phased_h_l290_c3_e334_stack_index,
put_stack_uxn_opcodes_phased_h_l290_c3_e334_offset,
put_stack_uxn_opcodes_phased_h_l290_c3_e334_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b
BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output);

-- result_MUX_uxn_opcodes_phased_h_l292_c7_c263
result_MUX_uxn_opcodes_phased_h_l292_c7_c263 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond,
result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue,
result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse,
result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output);

-- put_stack_uxn_opcodes_phased_h_l293_c3_70be
put_stack_uxn_opcodes_phased_h_l293_c3_70be : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l293_c3_70be_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l293_c3_70be_sp,
put_stack_uxn_opcodes_phased_h_l293_c3_70be_stack_index,
put_stack_uxn_opcodes_phased_h_l293_c3_70be_offset,
put_stack_uxn_opcodes_phased_h_l293_c3_70be_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f
BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output);

-- result_MUX_uxn_opcodes_phased_h_l295_c7_660e
result_MUX_uxn_opcodes_phased_h_l295_c7_660e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond,
result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue,
result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse,
result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output);

-- put_stack_uxn_opcodes_phased_h_l296_c3_eb4e
put_stack_uxn_opcodes_phased_h_l296_c3_eb4e : entity work.put_stack_0CLK_b888155f port map (
clk,
put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_CLOCK_ENABLE,
put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_sp,
put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_stack_index,
put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_offset,
put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d
BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output);

-- result_MUX_uxn_opcodes_phased_h_l298_c7_8836
result_MUX_uxn_opcodes_phased_h_l298_c7_8836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l298_c7_8836_cond,
result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iftrue,
result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iffalse,
result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output,
 t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output,
 n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output,
 result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output,
 l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output,
 set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output,
 t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output,
 n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output,
 result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output,
 l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output,
 t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output,
 t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output,
 n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output,
 result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output,
 l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output,
 n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output,
 n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output,
 result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output,
 l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output,
 l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output,
 result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output,
 l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output,
 l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output,
 result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output,
 result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output,
 result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output,
 result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output,
 result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_ptr : unsigned(7 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_index : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_ptr : unsigned(7 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_sp : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_right := to_unsigned(3, 2);
     VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_offset := resize(to_unsigned(2, 2), 8);
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iffalse := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_offset := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_mul := resize(to_unsigned(3, 2), 8);
     VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_right := to_unsigned(8, 4);
     VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_mul := resize(to_unsigned(3, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue := to_unsigned(0, 1);
     VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_right := to_unsigned(5, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_k := VAR_k;
     VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse := l8;
     VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_value := l8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse := n8;
     VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_value := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iffalse := result;
     VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_ptr := VAR_sp;
     VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_ptr := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_sp := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_sp := VAR_sp;
     VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_ptr := VAR_sp;
     VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_index := VAR_stack_index;
     VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_index := VAR_stack_index;
     VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_value := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l289_c11_6697] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l295_c11_568f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l298_c11_c23d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l283_c11_171c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l292_c11_6c6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l280_c11_c336] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l277_c11_846c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l286_c11_05d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l274_c11_c09d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l271_c6_d0d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l271_c6_d0d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l274_c11_c09d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l277_c11_846c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l280_c11_c336_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l283_c11_171c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l286_c11_05d1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l289_c11_6697_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l292_c11_6c6b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l295_c11_568f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l298_c11_c23d_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l298_c7_8836] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l298_c7_8836_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_cond;
     result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iftrue;
     result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output := result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l274_c7_841b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l271_c1_1cc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l271_c1_1cc4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l298_c7_8836_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l277_c7_c7b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l295_c7_660e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond;
     result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output := result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l272_c12_eab8] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_sp;
     set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_k;
     set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_mul;
     set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output := set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l274_c1_dbcc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l274_c1_dbcc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l272_c12_eab8_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l292_c7_c263] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond;
     result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue;
     result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output := result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l277_c1_b254] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output;

     -- t_register[uxn_opcodes_phased_h_l275_c8_8860] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l275_c8_8860_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_index;
     t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output := t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l280_c7_23ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l277_c1_b254_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue := VAR_t_register_uxn_opcodes_phased_h_l275_c8_8860_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l280_c1_ffba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l283_c7_64b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;

     -- n_register[uxn_opcodes_phased_h_l278_c8_9aba] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l278_c8_9aba_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_index;
     n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output := n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l289_c7_dcf0] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond;
     result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue;
     result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output := result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;
     VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l280_c1_ffba_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue := VAR_n_register_uxn_opcodes_phased_h_l278_c8_9aba_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l286_c7_2c35] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l286_c7_2c35] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_cond;
     result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iftrue;
     result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output := result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output;

     -- l_register[uxn_opcodes_phased_h_l281_c8_5cc4] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_phased_h_l281_c8_5cc4_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_index <= VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_index;
     l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_ptr <= VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_stack_ptr;
     -- Outputs
     VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output := l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l277_c7_c7b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond;
     t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output := t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l283_c1_ca6d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output;
     VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l283_c1_ca6d_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue := VAR_l_register_uxn_opcodes_phased_h_l281_c8_5cc4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l286_c7_2c35_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l286_c1_838b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l289_c7_dcf0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l283_c7_64b2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond;
     result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue;
     result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output := result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;

     -- l_register[uxn_opcodes_phased_h_l284_c8_25d0] LATENCY=0
     -- Clock enable
     l_register_uxn_opcodes_phased_h_l284_c8_25d0_CLOCK_ENABLE <= VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_CLOCK_ENABLE;
     -- Inputs
     l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_index <= VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_index;
     l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_ptr <= VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_stack_ptr;
     -- Outputs
     VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output := l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l280_c7_23ad] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond;
     n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output := n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l274_c7_841b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond;
     t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output := t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c7_dcf0_return_output;
     VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l286_c1_838b_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue := VAR_l_register_uxn_opcodes_phased_h_l284_c8_25d0_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l289_c1_6ed5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l271_c2_af4e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond;
     t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output := t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l292_c7_c263] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l277_c7_c7b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond;
     n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output := n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;

     -- l8_MUX[uxn_opcodes_phased_h_l283_c7_64b2] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_cond;
     l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output := l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;

     -- set[uxn_opcodes_phased_h_l287_c3_7b8f] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l287_c3_7b8f_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l287_c3_7b8f_sp <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_sp;
     set_uxn_opcodes_phased_h_l287_c3_7b8f_stack_index <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_stack_index;
     set_uxn_opcodes_phased_h_l287_c3_7b8f_ins <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_ins;
     set_uxn_opcodes_phased_h_l287_c3_7b8f_k <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_k;
     set_uxn_opcodes_phased_h_l287_c3_7b8f_mul <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_mul;
     set_uxn_opcodes_phased_h_l287_c3_7b8f_add <= VAR_set_uxn_opcodes_phased_h_l287_c3_7b8f_add;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l280_c7_23ad] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond;
     result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue;
     result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output := result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c7_c263_return_output;
     VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l289_c1_6ed5_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse := VAR_l8_MUX_uxn_opcodes_phased_h_l283_c7_64b2_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l277_c7_c7b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond;
     result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue;
     result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output := result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l274_c7_841b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond;
     n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output := n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l295_c7_660e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output;

     -- l8_MUX[uxn_opcodes_phased_h_l280_c7_23ad] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_cond;
     l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output := l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l292_c1_9091] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output;

     -- put_stack[uxn_opcodes_phased_h_l290_c3_e334] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l290_c3_e334_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l290_c3_e334_sp <= VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_sp;
     put_stack_uxn_opcodes_phased_h_l290_c3_e334_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_stack_index;
     put_stack_uxn_opcodes_phased_h_l290_c3_e334_offset <= VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_offset;
     put_stack_uxn_opcodes_phased_h_l290_c3_e334_value <= VAR_put_stack_uxn_opcodes_phased_h_l290_c3_e334_value;
     -- Outputs

     -- Submodule level 9
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c7_660e_return_output;
     VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l292_c1_9091_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse := VAR_l8_MUX_uxn_opcodes_phased_h_l280_c7_23ad_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;
     -- put_stack[uxn_opcodes_phased_h_l293_c3_70be] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l293_c3_70be_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l293_c3_70be_sp <= VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_sp;
     put_stack_uxn_opcodes_phased_h_l293_c3_70be_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_stack_index;
     put_stack_uxn_opcodes_phased_h_l293_c3_70be_offset <= VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_offset;
     put_stack_uxn_opcodes_phased_h_l293_c3_70be_value <= VAR_put_stack_uxn_opcodes_phased_h_l293_c3_70be_value;
     -- Outputs

     -- n8_MUX[uxn_opcodes_phased_h_l271_c2_af4e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond;
     n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output := n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l295_c1_2f86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l274_c7_841b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond;
     result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue;
     result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output := result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;

     -- l8_MUX[uxn_opcodes_phased_h_l277_c7_c7b9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_cond;
     l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output := l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;

     -- Submodule level 10
     VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l295_c1_2f86_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse := VAR_l8_MUX_uxn_opcodes_phased_h_l277_c7_c7b9_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;
     -- put_stack[uxn_opcodes_phased_h_l296_c3_eb4e] LATENCY=0
     -- Clock enable
     put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_CLOCK_ENABLE <= VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_sp <= VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_sp;
     put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_stack_index <= VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_stack_index;
     put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_offset <= VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_offset;
     put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_value <= VAR_put_stack_uxn_opcodes_phased_h_l296_c3_eb4e_value;
     -- Outputs

     -- l8_MUX[uxn_opcodes_phased_h_l274_c7_841b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_cond;
     l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output := l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l271_c2_af4e] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond;
     result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue;
     result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output := result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;

     -- Submodule level 11
     VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse := VAR_l8_MUX_uxn_opcodes_phased_h_l274_c7_841b_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;
     -- l8_MUX[uxn_opcodes_phased_h_l271_c2_af4e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_cond;
     l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output := l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;

     -- Submodule level 12
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_phased_h_l271_c2_af4e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n8 <= REG_COMB_n8;
     t8 <= REG_COMB_t8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
