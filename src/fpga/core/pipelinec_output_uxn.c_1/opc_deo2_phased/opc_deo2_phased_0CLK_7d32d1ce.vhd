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
-- Submodules: 90
entity opc_deo2_phased_0CLK_7d32d1ce is
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
end opc_deo2_phased_0CLK_7d32d1ce;
architecture arch of opc_deo2_phased_0CLK_7d32d1ce is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal h16 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_h16 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l955_c6_2498]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l955_c1_3294]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l959_c7_05ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l955_c2_5737]
signal t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l955_c2_5737]
signal n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);

-- h16_MUX[uxn_opcodes_phased_h_l955_c2_5737]
signal h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l955_c2_5737]
signal result_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l955_c2_5737]
signal l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l956_c12_dbf3]
signal set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l957_c8_4e76]
signal t_register_uxn_opcodes_phased_h_l957_c8_4e76_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l959_c11_0b89]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l959_c1_ca47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l962_c7_1c9b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l959_c7_05ba]
signal t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l959_c7_05ba]
signal n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);

-- h16_MUX[uxn_opcodes_phased_h_l959_c7_05ba]
signal h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l959_c7_05ba]
signal result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l959_c7_05ba]
signal l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_phased_h_l960_c8_5be5]
signal h2_register_uxn_opcodes_phased_h_l960_c8_5be5_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_ptr : unsigned(7 downto 0);
signal h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l962_c11_4319]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l962_c1_9a96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l968_c7_2cfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l962_c7_1c9b]
signal n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(7 downto 0);

-- h16_MUX[uxn_opcodes_phased_h_l962_c7_1c9b]
signal h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(7 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(7 downto 0);
signal h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l962_c7_1c9b]
signal result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_phased_h_l962_c7_1c9b]
signal l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(7 downto 0);

-- h2_register[uxn_opcodes_phased_h_l963_c9_f4c6]
signal h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_index : unsigned(0 downto 0);
signal h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_ptr : unsigned(7 downto 0);
signal h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_phased_h_l964_c18_bff0]
signal CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_x : unsigned(7 downto 0);
signal CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output : unsigned(7 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l966_c12_bb1f]
signal deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l968_c11_b563]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l968_c1_0d67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l972_c7_be36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l968_c7_2cfc]
signal result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l969_c3_9534]
signal set_uxn_opcodes_phased_h_l969_c3_9534_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l969_c3_9534_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l969_c3_9534_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l969_c3_9534_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l969_c3_9534_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l969_c3_9534_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l969_c3_9534_add : signed(7 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l970_c12_0de3]
signal deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l972_c11_d9de]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l972_c1_48ef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l975_c7_ea70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l972_c7_be36]
signal result_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output : unsigned(0 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l973_c12_95ef]
signal deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l975_c11_1f54]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l975_c1_c914]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l978_c7_74d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l975_c7_ea70]
signal result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output : unsigned(0 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l976_c12_9d91]
signal deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l978_c11_1aa2]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l978_c1_1200]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l981_c7_b554]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l978_c7_74d1]
signal result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output : unsigned(0 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l979_c12_a18a]
signal deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l981_c11_3beb]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l981_c1_21e7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l984_c7_fd97]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l981_c7_b554]
signal result_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output : unsigned(0 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l982_c12_f6f3]
signal deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l984_c11_11ca]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l984_c1_f7b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l987_c7_f627]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l984_c7_fd97]
signal result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l985_c28_9a7c]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output : unsigned(8 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l985_c12_e14a]
signal deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l987_c11_6744]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l987_c1_db87]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l990_c7_5b39]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l987_c7_f627]
signal result_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l988_c28_095f]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output : unsigned(8 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l988_c12_b90d]
signal deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l990_c11_99f5]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l990_c1_bb86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l993_c7_e3d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l990_c7_5b39]
signal result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l991_c28_d971]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output : unsigned(8 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l991_c12_e7b4]
signal deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l993_c11_dc38]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l993_c1_ab67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l996_c7_50c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l993_c7_e3d2]
signal result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l994_c28_e128]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output : unsigned(8 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l994_c12_fe3b]
signal deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l996_c11_a24e]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l996_c1_1480]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l999_c7_381d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l996_c7_50c7]
signal result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l997_c28_fdba]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output : unsigned(8 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l997_c12_8e7f]
signal deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l999_c11_521f]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l999_c1_5209]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l999_c7_381d]
signal result_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_phased_h_l1000_c28_99d8]
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output : unsigned(8 downto 0);

-- deo_phased[uxn_opcodes_phased_h_l1000_c12_3dcf]
signal deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_phase : unsigned(3 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_device_address : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_value : unsigned(7 downto 0);
signal deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498
BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l955_c2_5737
t8_MUX_uxn_opcodes_phased_h_l955_c2_5737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond,
t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue,
t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse,
t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l955_c2_5737
n8_MUX_uxn_opcodes_phased_h_l955_c2_5737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond,
n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue,
n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse,
n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output);

-- h16_MUX_uxn_opcodes_phased_h_l955_c2_5737
h16_MUX_uxn_opcodes_phased_h_l955_c2_5737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond,
h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue,
h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse,
h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output);

-- result_MUX_uxn_opcodes_phased_h_l955_c2_5737
result_MUX_uxn_opcodes_phased_h_l955_c2_5737 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond,
result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue,
result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse,
result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l955_c2_5737
l8_MUX_uxn_opcodes_phased_h_l955_c2_5737 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond,
l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue,
l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse,
l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_sp,
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_k,
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_mul,
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_add,
set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output);

-- t_register_uxn_opcodes_phased_h_l957_c8_4e76
t_register_uxn_opcodes_phased_h_l957_c8_4e76 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l957_c8_4e76_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_index,
t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_ptr,
t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89
BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba
t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond,
t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue,
t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse,
t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba
n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond,
n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue,
n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse,
n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output);

-- h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba
h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond,
h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue,
h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse,
h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output);

-- result_MUX_uxn_opcodes_phased_h_l959_c7_05ba
result_MUX_uxn_opcodes_phased_h_l959_c7_05ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond,
result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue,
result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse,
result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba
l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond,
l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue,
l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse,
l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output);

-- h2_register_uxn_opcodes_phased_h_l960_c8_5be5
h2_register_uxn_opcodes_phased_h_l960_c8_5be5 : entity work.h2_register_0CLK_a2cd5ea9 port map (
clk,
h2_register_uxn_opcodes_phased_h_l960_c8_5be5_CLOCK_ENABLE,
h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_index,
h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_ptr,
h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319
BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b
n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond,
n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue,
n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse,
n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output);

-- h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b
h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond,
h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue,
h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse,
h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output);

-- result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b
result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond,
result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue,
result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse,
result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output);

-- l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b
l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond,
l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue,
l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse,
l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output);

-- h2_register_uxn_opcodes_phased_h_l963_c9_f4c6
h2_register_uxn_opcodes_phased_h_l963_c9_f4c6 : entity work.h2_register_0CLK_a2cd5ea9 port map (
clk,
h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_CLOCK_ENABLE,
h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_index,
h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_ptr,
h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output);

-- CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0
CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0 : entity work.CONST_SR_8_uint8_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_x,
CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output);

-- deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f
deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_phase,
deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_device_address,
deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_value,
deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563
BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output);

-- result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc
result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond,
result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue,
result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse,
result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output);

-- set_uxn_opcodes_phased_h_l969_c3_9534
set_uxn_opcodes_phased_h_l969_c3_9534 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l969_c3_9534_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l969_c3_9534_sp,
set_uxn_opcodes_phased_h_l969_c3_9534_stack_index,
set_uxn_opcodes_phased_h_l969_c3_9534_ins,
set_uxn_opcodes_phased_h_l969_c3_9534_k,
set_uxn_opcodes_phased_h_l969_c3_9534_mul,
set_uxn_opcodes_phased_h_l969_c3_9534_add);

-- deo_phased_uxn_opcodes_phased_h_l970_c12_0de3
deo_phased_uxn_opcodes_phased_h_l970_c12_0de3 : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_phase,
deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_device_address,
deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_value,
deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de
BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output);

-- result_MUX_uxn_opcodes_phased_h_l972_c7_be36
result_MUX_uxn_opcodes_phased_h_l972_c7_be36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond,
result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue,
result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse,
result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output);

-- deo_phased_uxn_opcodes_phased_h_l973_c12_95ef
deo_phased_uxn_opcodes_phased_h_l973_c12_95ef : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_phase,
deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_device_address,
deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_value,
deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54
BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output);

-- result_MUX_uxn_opcodes_phased_h_l975_c7_ea70
result_MUX_uxn_opcodes_phased_h_l975_c7_ea70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond,
result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue,
result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse,
result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output);

-- deo_phased_uxn_opcodes_phased_h_l976_c12_9d91
deo_phased_uxn_opcodes_phased_h_l976_c12_9d91 : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_phase,
deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_device_address,
deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_value,
deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2
BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output);

-- result_MUX_uxn_opcodes_phased_h_l978_c7_74d1
result_MUX_uxn_opcodes_phased_h_l978_c7_74d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond,
result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue,
result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse,
result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output);

-- deo_phased_uxn_opcodes_phased_h_l979_c12_a18a
deo_phased_uxn_opcodes_phased_h_l979_c12_a18a : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_phase,
deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_device_address,
deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_value,
deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb
BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output);

-- result_MUX_uxn_opcodes_phased_h_l981_c7_b554
result_MUX_uxn_opcodes_phased_h_l981_c7_b554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond,
result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue,
result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse,
result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output);

-- deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3
deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3 : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_phase,
deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_device_address,
deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_value,
deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca
BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output);

-- result_MUX_uxn_opcodes_phased_h_l984_c7_fd97
result_MUX_uxn_opcodes_phased_h_l984_c7_fd97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond,
result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue,
result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse,
result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c
BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output);

-- deo_phased_uxn_opcodes_phased_h_l985_c12_e14a
deo_phased_uxn_opcodes_phased_h_l985_c12_e14a : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_phase,
deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_device_address,
deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_value,
deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744
BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output);

-- result_MUX_uxn_opcodes_phased_h_l987_c7_f627
result_MUX_uxn_opcodes_phased_h_l987_c7_f627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond,
result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue,
result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse,
result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f
BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output);

-- deo_phased_uxn_opcodes_phased_h_l988_c12_b90d
deo_phased_uxn_opcodes_phased_h_l988_c12_b90d : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_phase,
deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_device_address,
deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_value,
deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5
BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output);

-- result_MUX_uxn_opcodes_phased_h_l990_c7_5b39
result_MUX_uxn_opcodes_phased_h_l990_c7_5b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond,
result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue,
result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse,
result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971
BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output);

-- deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4
deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4 : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_phase,
deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_device_address,
deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_value,
deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38
BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output);

-- result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2
result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond,
result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue,
result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse,
result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128
BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output);

-- deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b
deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_phase,
deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_device_address,
deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_value,
deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e
BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output);

-- result_MUX_uxn_opcodes_phased_h_l996_c7_50c7
result_MUX_uxn_opcodes_phased_h_l996_c7_50c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond,
result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue,
result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse,
result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba
BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output);

-- deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f
deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_phase,
deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_device_address,
deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_value,
deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f
BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output);

-- result_MUX_uxn_opcodes_phased_h_l999_c7_381d
result_MUX_uxn_opcodes_phased_h_l999_c7_381d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond,
result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue,
result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse,
result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8
BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_left,
BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_right,
BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output);

-- deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf
deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf : entity work.deo_phased_0CLK_0ef75794 port map (
clk,
deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_CLOCK_ENABLE,
deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_phase,
deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_device_address,
deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_value,
deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output);



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
 h16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output,
 t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output,
 n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output,
 h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output,
 result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output,
 l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output,
 set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output,
 t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output,
 t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output,
 n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output,
 h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output,
 result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output,
 l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output,
 h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output,
 n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output,
 h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output,
 result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output,
 l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output,
 h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output,
 CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output,
 deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output,
 result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output,
 deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output,
 result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output,
 deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output,
 result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output,
 deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output,
 result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output,
 deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output,
 result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output,
 deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output,
 result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output,
 deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output,
 result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output,
 deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output,
 result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output,
 deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output,
 result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output,
 deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output,
 result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output,
 deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output,
 result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output,
 BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output,
 deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_uxn_opcodes_phased_h_l960_c3_d5b1 : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_ptr : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(7 downto 0);
 variable VAR_h16_uxn_opcodes_phased_h_l963_c3_6f03 : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(7 downto 0);
 variable VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_index : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_ptr : unsigned(7 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_x : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_value : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l969_c3_9534_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_value : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_value : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_value : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_value : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_value : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output : unsigned(8 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output : unsigned(8 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output : unsigned(8 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output : unsigned(8 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output : unsigned(8 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_phase : unsigned(3 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_device_address : unsigned(7 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output : unsigned(8 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_h16 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n8 := n8;
  REG_VAR_t8 := t8;
  REG_VAR_l8 := l8;
  REG_VAR_h16 := h16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_right := to_unsigned(8, 4);
     VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_phase := resize(to_unsigned(2, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_right := to_unsigned(13, 4);
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_add := resize(to_signed(-3, 3), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iffalse := to_unsigned(0, 1);
     VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_phase := resize(to_unsigned(4, 3), 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_right := to_unsigned(4, 3);
     VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_phase := resize(to_unsigned(3, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_right := to_unsigned(11, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_right := to_unsigned(1, 1);
     VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_phase := resize(to_unsigned(0, 1), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iffalse := to_unsigned(0, 1);
     VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_phase := resize(to_unsigned(3, 2), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_right := to_unsigned(1, 1);
     VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_phase := resize(to_unsigned(0, 1), 4);
     VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_phase := resize(to_unsigned(5, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_right := to_unsigned(6, 3);
     VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_phase := resize(to_unsigned(5, 3), 4);
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_mul := resize(to_unsigned(3, 2), 8);
     VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_mul := resize(to_unsigned(3, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_right := to_unsigned(9, 4);
     VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_phase := resize(to_unsigned(2, 2), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_right := to_unsigned(1, 1);
     VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_phase := resize(to_unsigned(1, 1), 4);
     VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_phase := resize(to_unsigned(1, 1), 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_right := to_unsigned(10, 4);
     VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_phase := resize(to_unsigned(4, 3), 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue := to_unsigned(0, 1);
     VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_add := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_right := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iftrue := VAR_CLOCK_ENABLE;
     VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue := h16;
     VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue := h16;
     VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse := h16;
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_k := VAR_k;
     VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_value := l8;
     VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_value := l8;
     VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_value := l8;
     VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_value := l8;
     VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_value := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse := l8;
     VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_value := n8;
     VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_value := n8;
     VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_value := n8;
     VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_value := n8;
     VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_value := n8;
     VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_value := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse := result;
     VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_ptr := VAR_sp;
     VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_ptr := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_ptr := VAR_sp;
     VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_index := VAR_stack_index;
     VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_index := VAR_stack_index;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_left := t8;
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_left := t8;
     VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_device_address := t8;
     VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_device_address := t8;
     VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_device_address := t8;
     VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_device_address := t8;
     VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_device_address := t8;
     VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l968_c11_b563] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l996_c11_a24e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l987_c11_6744] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l975_c11_1f54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l962_c11_4319] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l978_c11_1aa2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l985_c28_9a7c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l991_c28_d971] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l959_c11_0b89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l972_c11_d9de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l1000_c28_99d8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l997_c28_fdba] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l993_c11_dc38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l981_c11_3beb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l990_c11_99f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l999_c11_521f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l994_c28_e128] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l955_c6_2498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_phased_h_l988_c28_095f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_left;
     BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output := BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l984_c11_11ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l955_c6_2498_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l959_c11_0b89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;
     VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l962_c11_4319_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l968_c11_b563_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l972_c11_d9de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l975_c11_1f54_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l978_c11_1aa2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l981_c11_3beb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l984_c11_11ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l987_c11_6744_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l990_c11_99f5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l993_c11_dc38_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l996_c11_a24e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l999_c11_521f_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_device_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l1000_c28_99d8_return_output, 8);
     VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_device_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l985_c28_9a7c_return_output, 8);
     VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_device_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l988_c28_095f_return_output, 8);
     VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_device_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l991_c28_d971_return_output, 8);
     VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_device_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l994_c28_e128_return_output, 8);
     VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_device_address := resize(VAR_BIN_OP_PLUS_uxn_opcodes_phased_h_l997_c28_fdba_return_output, 8);
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l955_c1_3294] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l959_c7_05ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l955_c1_3294_return_output;
     -- set_will_fail[uxn_opcodes_phased_h_l956_c12_dbf3] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_sp;
     set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_k;
     set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_mul;
     set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output := set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l962_c7_1c9b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l959_c1_ca47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output;

     -- t_register[uxn_opcodes_phased_h_l957_c8_4e76] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l957_c8_4e76_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_index;
     t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output := t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;
     VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l959_c1_ca47_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l956_c12_dbf3_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue := VAR_t_register_uxn_opcodes_phased_h_l957_c8_4e76_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l962_c1_9a96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output;

     -- h2_register[uxn_opcodes_phased_h_l960_c8_5be5] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_phased_h_l960_c8_5be5_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_index <= VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_index;
     h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_ptr <= VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_stack_ptr;
     -- Outputs
     VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output := h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l968_c7_2cfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output;
     VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l962_c1_9a96_return_output;
     VAR_t8_uxn_opcodes_phased_h_l960_c3_d5b1 := resize(VAR_h2_register_uxn_opcodes_phased_h_l960_c8_5be5_return_output, 8);
     VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue := VAR_t8_uxn_opcodes_phased_h_l960_c3_d5b1;
     -- h2_register[uxn_opcodes_phased_h_l963_c9_f4c6] LATENCY=0
     -- Clock enable
     h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_CLOCK_ENABLE <= VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_CLOCK_ENABLE;
     -- Inputs
     h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_index <= VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_index;
     h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_ptr <= VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_stack_ptr;
     -- Outputs
     VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output := h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l972_c7_be36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l968_c1_0d67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l959_c7_05ba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond;
     t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output := t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output;
     VAR_set_uxn_opcodes_phased_h_l969_c3_9534_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l968_c1_0d67_return_output;
     VAR_h16_uxn_opcodes_phased_h_l963_c3_6f03 := resize(VAR_h2_register_uxn_opcodes_phased_h_l963_c9_f4c6_return_output, 8);
     VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_x := VAR_h16_uxn_opcodes_phased_h_l963_c3_6f03;
     VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue := VAR_h16_uxn_opcodes_phased_h_l963_c3_6f03;
     VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue := VAR_h16_uxn_opcodes_phased_h_l963_c3_6f03;
     -- deo_phased[uxn_opcodes_phased_h_l970_c12_0de3] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_phase;
     deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_device_address;
     deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_value <= VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output := deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output;

     -- CONST_SR_8[uxn_opcodes_phased_h_l964_c18_bff0] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_x <= VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output := CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l962_c7_1c9b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond;
     n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output := n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l972_c1_48ef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l975_c7_ea70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l955_c2_5737] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond;
     t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output := t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;

     -- set[uxn_opcodes_phased_h_l969_c3_9534] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l969_c3_9534_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l969_c3_9534_sp <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_sp;
     set_uxn_opcodes_phased_h_l969_c3_9534_stack_index <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_stack_index;
     set_uxn_opcodes_phased_h_l969_c3_9534_ins <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_ins;
     set_uxn_opcodes_phased_h_l969_c3_9534_k <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_k;
     set_uxn_opcodes_phased_h_l969_c3_9534_mul <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_mul;
     set_uxn_opcodes_phased_h_l969_c3_9534_add <= VAR_set_uxn_opcodes_phased_h_l969_c3_9534_add;
     -- Outputs

     -- h16_MUX[uxn_opcodes_phased_h_l962_c7_1c9b] LATENCY=0
     -- Inputs
     h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond <= VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond;
     h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue <= VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue;
     h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse <= VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse;
     -- Outputs
     VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output := h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;

     -- Submodule level 6
     VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_value := VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue := VAR_CONST_SR_8_uxn_opcodes_phased_h_l964_c18_bff0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l972_c1_48ef_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l970_c12_0de3_return_output;
     VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse := VAR_h16_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;
     -- l8_MUX[uxn_opcodes_phased_h_l962_c7_1c9b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond;
     l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output := l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l978_c7_74d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l973_c12_95ef] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_phase;
     deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_device_address;
     deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_value <= VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output := deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output;

     -- h16_MUX[uxn_opcodes_phased_h_l959_c7_05ba] LATENCY=0
     -- Inputs
     h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond <= VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond;
     h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue <= VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue;
     h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse <= VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse;
     -- Outputs
     VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output := h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l959_c7_05ba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond;
     n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output := n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l975_c1_c914] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l966_c12_bb1f] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_phase;
     deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_device_address;
     deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_value <= VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output := deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l975_c1_c914_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l966_c12_bb1f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l973_c12_95ef_return_output;
     VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse := VAR_h16_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse := VAR_l8_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     -- deo_phased[uxn_opcodes_phased_h_l976_c12_9d91] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_phase;
     deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_device_address;
     deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_value <= VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output := deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l955_c2_5737] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond;
     n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output := n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;

     -- l8_MUX[uxn_opcodes_phased_h_l959_c7_05ba] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond;
     l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output := l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l978_c1_1200] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l981_c7_b554] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output;

     -- h16_MUX[uxn_opcodes_phased_h_l955_c2_5737] LATENCY=0
     -- Inputs
     h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond <= VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond;
     h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue <= VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue;
     h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse <= VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse;
     -- Outputs
     VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output := h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l978_c1_1200_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l976_c12_9d91_return_output;
     REG_VAR_h16 := VAR_h16_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;
     VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse := VAR_l8_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;
     -- l8_MUX[uxn_opcodes_phased_h_l955_c2_5737] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond <= VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond;
     l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue <= VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue;
     l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse <= VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output := l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l984_c7_fd97] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l979_c12_a18a] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_phase;
     deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_device_address;
     deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_value <= VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output := deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l981_c1_21e7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l981_c1_21e7_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l979_c12_a18a_return_output;
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l987_c7_f627] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l984_c1_f7b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l982_c12_f6f3] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_phase;
     deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_device_address;
     deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_value <= VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output := deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l984_c1_f7b4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l982_c12_f6f3_return_output;
     -- deo_phased[uxn_opcodes_phased_h_l985_c12_e14a] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_phase;
     deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_device_address;
     deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_value <= VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output := deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l990_c7_5b39] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l987_c1_db87] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l987_c1_db87_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l985_c12_e14a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l990_c1_bb86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l988_c12_b90d] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_phase;
     deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_device_address;
     deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_value <= VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output := deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l993_c7_e3d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l990_c1_bb86_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l988_c12_b90d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l996_c7_50c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l991_c12_e7b4] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_phase;
     deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_device_address;
     deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_value <= VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output := deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l993_c1_ab67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l993_c1_ab67_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l991_c12_e7b4_return_output;
     -- deo_phased[uxn_opcodes_phased_h_l994_c12_fe3b] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_phase;
     deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_device_address;
     deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_value <= VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output := deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l996_c1_1480] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l999_c7_381d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output;

     -- Submodule level 14
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output;
     VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l996_c1_1480_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l994_c12_fe3b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l999_c1_5209] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output;

     -- deo_phased[uxn_opcodes_phased_h_l997_c12_8e7f] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_phase;
     deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_device_address;
     deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_value <= VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output := deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output;

     -- Submodule level 15
     VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l999_c1_5209_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l997_c12_8e7f_return_output;
     -- deo_phased[uxn_opcodes_phased_h_l1000_c12_3dcf] LATENCY=0
     -- Clock enable
     deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_CLOCK_ENABLE <= VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_CLOCK_ENABLE;
     -- Inputs
     deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_phase <= VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_phase;
     deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_device_address <= VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_device_address;
     deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_value <= VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_value;
     -- Outputs
     VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output := deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue := VAR_deo_phased_uxn_opcodes_phased_h_l1000_c12_3dcf_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l999_c7_381d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_cond;
     result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iftrue;
     result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output := result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l999_c7_381d_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l996_c7_50c7] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_cond;
     result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iftrue;
     result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output := result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l996_c7_50c7_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l993_c7_e3d2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_cond;
     result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iftrue;
     result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output := result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l993_c7_e3d2_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l990_c7_5b39] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_cond;
     result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iftrue;
     result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output := result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l990_c7_5b39_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l987_c7_f627] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_cond;
     result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iftrue;
     result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output := result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l987_c7_f627_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l984_c7_fd97] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_cond;
     result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iftrue;
     result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output := result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l984_c7_fd97_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l981_c7_b554] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_cond;
     result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iftrue;
     result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output := result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l981_c7_b554_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l978_c7_74d1] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_cond;
     result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iftrue;
     result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output := result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l978_c7_74d1_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l975_c7_ea70] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_cond;
     result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iftrue;
     result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output := result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l975_c7_ea70_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l972_c7_be36] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_cond;
     result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iftrue;
     result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output := result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l972_c7_be36_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l968_c7_2cfc] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_cond;
     result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iftrue;
     result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output := result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l968_c7_2cfc_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l962_c7_1c9b] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_cond;
     result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iftrue;
     result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output := result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;

     -- Submodule level 28
     VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l962_c7_1c9b_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l959_c7_05ba] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_cond;
     result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iftrue;
     result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output := result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;

     -- Submodule level 29
     VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l959_c7_05ba_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l955_c2_5737] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_cond;
     result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iftrue;
     result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output := result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;

     -- Submodule level 30
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l955_c2_5737_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_h16 <= REG_VAR_h16;
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
     h16 <= REG_COMB_h16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
