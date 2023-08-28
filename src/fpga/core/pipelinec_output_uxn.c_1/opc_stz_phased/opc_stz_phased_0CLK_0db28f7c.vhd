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
-- Submodules: 38
entity opc_stz_phased_0CLK_0db28f7c is
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
end opc_stz_phased_0CLK_0db28f7c;
architecture arch of opc_stz_phased_0CLK_0db28f7c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l712_c6_d928]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l712_c1_b510]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l715_c7_c745]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l712_c2_2c7d]
signal t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l712_c2_2c7d]
signal n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l712_c2_2c7d]
signal tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l712_c2_2c7d]
signal result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l713_c12_feaa]
signal set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l715_c11_6aa8]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l715_c1_4c48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l718_c7_47d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l715_c7_c745]
signal t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l715_c7_c745]
signal n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l715_c7_c745]
signal tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l715_c7_c745]
signal result_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l716_c8_ce15]
signal t_register_uxn_opcodes_phased_h_l716_c8_ce15_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l718_c11_7311]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l718_c1_05f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l722_c7_084c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l718_c7_47d8]
signal t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l718_c7_47d8]
signal n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_phased_h_l718_c7_47d8]
signal tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(15 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l718_c7_47d8]
signal result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(0 downto 0);

-- n_register[uxn_opcodes_phased_h_l719_c8_d2f4]
signal n_register_uxn_opcodes_phased_h_l719_c8_d2f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l722_c11_66c4]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l722_c1_5838]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l725_c7_3632]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_phased_h_l722_c7_084c]
signal n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l722_c7_084c]
signal result_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output : unsigned(0 downto 0);

-- n_register[uxn_opcodes_phased_h_l723_c8_5265]
signal n_register_uxn_opcodes_phased_h_l723_c8_5265_CLOCK_ENABLE : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_index : unsigned(0 downto 0);
signal n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_ptr : unsigned(7 downto 0);
signal n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l725_c11_f7a3]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l725_c1_4019]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l725_c7_3632]
signal result_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l726_c3_b0b0]
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l726_c3_b0b0_add : signed(7 downto 0);

-- poke_ram[uxn_opcodes_phased_h_l727_c3_3748]
signal poke_ram_uxn_opcodes_phased_h_l727_c3_3748_CLOCK_ENABLE : unsigned(0 downto 0);
signal poke_ram_uxn_opcodes_phased_h_l727_c3_3748_address : unsigned(15 downto 0);
signal poke_ram_uxn_opcodes_phased_h_l727_c3_3748_value : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l729_c11_fe6a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l729_c7_6e7a]
signal result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928
BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d
t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond,
t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue,
t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse,
t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d
n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond,
n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue,
n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse,
n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d
tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond,
tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output);

-- result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d
result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond,
result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue,
result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse,
result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_sp,
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_k,
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_mul,
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_add,
set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8
BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l715_c7_c745
t8_MUX_uxn_opcodes_phased_h_l715_c7_c745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond,
t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue,
t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse,
t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l715_c7_c745
n8_MUX_uxn_opcodes_phased_h_l715_c7_c745 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond,
n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue,
n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse,
n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745
tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond,
tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output);

-- result_MUX_uxn_opcodes_phased_h_l715_c7_c745
result_MUX_uxn_opcodes_phased_h_l715_c7_c745 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond,
result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue,
result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse,
result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output);

-- t_register_uxn_opcodes_phased_h_l716_c8_ce15
t_register_uxn_opcodes_phased_h_l716_c8_ce15 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l716_c8_ce15_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_index,
t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_ptr,
t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311
BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8
t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond,
t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue,
t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse,
t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8
n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond,
n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue,
n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse,
n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output);

-- tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8
tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond,
tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue,
tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse,
tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output);

-- result_MUX_uxn_opcodes_phased_h_l718_c7_47d8
result_MUX_uxn_opcodes_phased_h_l718_c7_47d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond,
result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue,
result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse,
result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output);

-- n_register_uxn_opcodes_phased_h_l719_c8_d2f4
n_register_uxn_opcodes_phased_h_l719_c8_d2f4 : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l719_c8_d2f4_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_index,
n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_ptr,
n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4
BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output);

-- n8_MUX_uxn_opcodes_phased_h_l722_c7_084c
n8_MUX_uxn_opcodes_phased_h_l722_c7_084c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond,
n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue,
n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse,
n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output);

-- result_MUX_uxn_opcodes_phased_h_l722_c7_084c
result_MUX_uxn_opcodes_phased_h_l722_c7_084c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond,
result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue,
result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse,
result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output);

-- n_register_uxn_opcodes_phased_h_l723_c8_5265
n_register_uxn_opcodes_phased_h_l723_c8_5265 : entity work.n_register_0CLK_621d5f60 port map (
clk,
n_register_uxn_opcodes_phased_h_l723_c8_5265_CLOCK_ENABLE,
n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_index,
n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_ptr,
n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3
BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output);

-- result_MUX_uxn_opcodes_phased_h_l725_c7_3632
result_MUX_uxn_opcodes_phased_h_l725_c7_3632 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond,
result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue,
result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse,
result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output);

-- set_uxn_opcodes_phased_h_l726_c3_b0b0
set_uxn_opcodes_phased_h_l726_c3_b0b0 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l726_c3_b0b0_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l726_c3_b0b0_sp,
set_uxn_opcodes_phased_h_l726_c3_b0b0_stack_index,
set_uxn_opcodes_phased_h_l726_c3_b0b0_ins,
set_uxn_opcodes_phased_h_l726_c3_b0b0_k,
set_uxn_opcodes_phased_h_l726_c3_b0b0_mul,
set_uxn_opcodes_phased_h_l726_c3_b0b0_add);

-- poke_ram_uxn_opcodes_phased_h_l727_c3_3748
poke_ram_uxn_opcodes_phased_h_l727_c3_3748 : entity work.poke_ram_0CLK_de264c78 port map (
poke_ram_uxn_opcodes_phased_h_l727_c3_3748_CLOCK_ENABLE,
poke_ram_uxn_opcodes_phased_h_l727_c3_3748_address,
poke_ram_uxn_opcodes_phased_h_l727_c3_3748_value);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a
BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output);

-- result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a
result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_cond,
result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iftrue,
result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iffalse,
result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output);



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
 tmp16,
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output,
 t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output,
 n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output,
 result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output,
 set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output,
 t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output,
 n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output,
 result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output,
 t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output,
 t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output,
 n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output,
 tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output,
 result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output,
 n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output,
 n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output,
 result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output,
 n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output,
 result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output,
 result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output)
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
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_phased_h_l720_c11_446d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_index : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_ptr : unsigned(7 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_address : unsigned(15 downto 0);
 variable VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_value : unsigned(7 downto 0);
 variable VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_right := to_unsigned(3, 2);
     VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_add := resize(to_signed(-2, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_add := resize(to_signed(-2, 3), 8);
     VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_mul := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iffalse := to_unsigned(0, 1);
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_mul := resize(to_unsigned(2, 2), 8);
     VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_right := to_unsigned(4, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_k := VAR_k;
     VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse := n8;
     VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_value := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iffalse := result;
     VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_ptr := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_ptr := VAR_sp;
     VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_index := VAR_stack_index;
     VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_index := VAR_stack_index;
     VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse := t8;
     VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_address := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l725_c11_f7a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l712_c6_d928] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l729_c11_fe6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l718_c11_7311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l715_c11_6aa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l722_c11_66c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l712_c6_d928_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l715_c11_6aa8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l718_c11_7311_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l722_c11_66c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l725_c11_f7a3_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l729_c11_fe6a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l712_c1_b510] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l715_c7_c745] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l729_c7_6e7a] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_cond;
     result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iftrue;
     result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output := result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l712_c1_b510_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l729_c7_6e7a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l718_c7_47d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l725_c7_3632] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond;
     result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue;
     result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output := result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l715_c1_4c48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output;

     -- set_will_fail[uxn_opcodes_phased_h_l713_c12_feaa] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_sp;
     set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_k;
     set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_mul;
     set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output := set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l715_c1_4c48_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l713_c12_feaa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l722_c7_084c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l722_c7_084c] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond;
     result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue;
     result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output := result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l718_c1_05f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output;

     -- t_register[uxn_opcodes_phased_h_l716_c8_ce15] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l716_c8_ce15_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_index;
     t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output := t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l718_c1_05f8_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue := VAR_t_register_uxn_opcodes_phased_h_l716_c8_ce15_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l722_c1_5838] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output;

     -- result_MUX[uxn_opcodes_phased_h_l718_c7_47d8] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond;
     result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue;
     result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output := result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;

     -- n_register[uxn_opcodes_phased_h_l719_c8_d2f4] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l719_c8_d2f4_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_index;
     n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output := n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l725_c7_3632] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output;

     -- Submodule level 5
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c7_3632_return_output;
     VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l722_c1_5838_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue := VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;
     -- CAST_TO_uint16_t[uxn_opcodes_phased_h_l720_c11_446d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_phased_h_l720_c11_446d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_n_register_uxn_opcodes_phased_h_l719_c8_d2f4_return_output);

     -- result_MUX[uxn_opcodes_phased_h_l715_c7_c745] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond;
     result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue;
     result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output := result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;

     -- n_register[uxn_opcodes_phased_h_l723_c8_5265] LATENCY=0
     -- Clock enable
     n_register_uxn_opcodes_phased_h_l723_c8_5265_CLOCK_ENABLE <= VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_CLOCK_ENABLE;
     -- Inputs
     n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_index <= VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_index;
     n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_ptr <= VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_stack_ptr;
     -- Outputs
     VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output := n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l725_c1_4019] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l718_c7_47d8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond;
     t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output := t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;

     -- Submodule level 6
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_phased_h_l720_c11_446d_return_output;
     VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output;
     VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l725_c1_4019_return_output;
     VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue := VAR_n_register_uxn_opcodes_phased_h_l723_c8_5265_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;
     -- set[uxn_opcodes_phased_h_l726_c3_b0b0] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l726_c3_b0b0_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l726_c3_b0b0_sp <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_sp;
     set_uxn_opcodes_phased_h_l726_c3_b0b0_stack_index <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_stack_index;
     set_uxn_opcodes_phased_h_l726_c3_b0b0_ins <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_ins;
     set_uxn_opcodes_phased_h_l726_c3_b0b0_k <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_k;
     set_uxn_opcodes_phased_h_l726_c3_b0b0_mul <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_mul;
     set_uxn_opcodes_phased_h_l726_c3_b0b0_add <= VAR_set_uxn_opcodes_phased_h_l726_c3_b0b0_add;
     -- Outputs

     -- result_MUX[uxn_opcodes_phased_h_l712_c2_2c7d] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond;
     result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue;
     result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output := result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;

     -- n8_MUX[uxn_opcodes_phased_h_l722_c7_084c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_cond;
     n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output := n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l715_c7_c745] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond;
     t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output := t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;

     -- poke_ram[uxn_opcodes_phased_h_l727_c3_3748] LATENCY=0
     -- Clock enable
     poke_ram_uxn_opcodes_phased_h_l727_c3_3748_CLOCK_ENABLE <= VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_CLOCK_ENABLE;
     -- Inputs
     poke_ram_uxn_opcodes_phased_h_l727_c3_3748_address <= VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_address;
     poke_ram_uxn_opcodes_phased_h_l727_c3_3748_value <= VAR_poke_ram_uxn_opcodes_phased_h_l727_c3_3748_value;
     -- Outputs

     -- tmp16_MUX[uxn_opcodes_phased_h_l718_c7_47d8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output := tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l722_c7_084c_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse := VAR_tmp16_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;
     -- n8_MUX[uxn_opcodes_phased_h_l718_c7_47d8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_cond;
     n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output := n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;

     -- tmp16_MUX[uxn_opcodes_phased_h_l715_c7_c745] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output := tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l712_c2_2c7d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond;
     t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output := t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;

     -- Submodule level 8
     VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l718_c7_47d8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;
     -- n8_MUX[uxn_opcodes_phased_h_l715_c7_c745] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_cond;
     n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output := n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;

     -- tmp16_MUX[uxn_opcodes_phased_h_l712_c2_2c7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond;
     tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue;
     tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output := tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;

     -- Submodule level 9
     VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse := VAR_n8_MUX_uxn_opcodes_phased_h_l715_c7_c745_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;
     -- n8_MUX[uxn_opcodes_phased_h_l712_c2_2c7d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond <= VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_cond;
     n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue <= VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iftrue;
     n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse <= VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output := n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;

     -- Submodule level 10
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_phased_h_l712_c2_2c7d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
