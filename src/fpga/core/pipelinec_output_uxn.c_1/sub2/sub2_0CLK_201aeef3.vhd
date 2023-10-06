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
-- Submodules: 123
entity sub2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_201aeef3;
architecture arch of sub2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2905_c6_0c20]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_0e74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2905_c2_2832]
signal n16_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2905_c2_2832]
signal t16_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2905_c2_2832]
signal tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2905_c2_2832]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2906_c3_e678[uxn_opcodes_h_l2906_c3_e678]
signal printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_1b13]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal n16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal t16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2911_c7_24e6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_fc9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2914_c7_b1ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_421b]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2919_c7_144a]
signal n16_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2919_c7_144a]
signal t16_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2919_c7_144a]
signal tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2919_c7_144a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_b7fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2922_c7_6b7d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2923_c3_0cd9]
signal BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_72f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal n16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2926_c7_5c17]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_56a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2929_c7_b2e1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_8967]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal n16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2934_c7_14d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_8d1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal n16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2937_c7_e8da]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2938_c3_69f8]
signal BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2939_c11_eddc]
signal BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2942_c32_8a97]
signal BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2942_c32_e44b]
signal BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2942_c32_e4a3]
signal MUX_uxn_opcodes_h_l2942_c32_e4a3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2942_c32_e4a3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2942_c32_e4a3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_c630]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c7_b83b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2944_c7_b83b]
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c7_b83b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c7_b83b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c7_b83b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_4b3a]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2950_c7_375d]
signal result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2950_c7_375d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2950_c7_375d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2950_c7_375d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2952_c34_5d5c]
signal CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_845a]
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2954_c7_87ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2954_c7_87ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20
BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output);

-- n16_MUX_uxn_opcodes_h_l2905_c2_2832
n16_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
n16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
n16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- t16_MUX_uxn_opcodes_h_l2905_c2_2832
t16_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
t16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
t16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2905_c2_2832
tmp16_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832
result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832
result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832
result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832
result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832
result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832
result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

-- printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678
printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678 : entity work.printf_uxn_opcodes_h_l2906_c3_e678_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output);

-- n16_MUX_uxn_opcodes_h_l2911_c7_24e6
n16_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- t16_MUX_uxn_opcodes_h_l2911_c7_24e6
t16_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6
tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6
result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6
result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6
result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6
result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6
result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output);

-- n16_MUX_uxn_opcodes_h_l2914_c7_b1ba
n16_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- t16_MUX_uxn_opcodes_h_l2914_c7_b1ba
t16_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba
tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba
result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output);

-- n16_MUX_uxn_opcodes_h_l2919_c7_144a
n16_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
n16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
n16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- t16_MUX_uxn_opcodes_h_l2919_c7_144a
t16_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
t16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
t16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2919_c7_144a
tmp16_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a
result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a
result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a
result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a
result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a
result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output);

-- n16_MUX_uxn_opcodes_h_l2922_c7_6b7d
n16_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- t16_MUX_uxn_opcodes_h_l2922_c7_6b7d
t16_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d
tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d
result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9
BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_left,
BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_right,
BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output);

-- n16_MUX_uxn_opcodes_h_l2926_c7_5c17
n16_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17
tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17
result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17
result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17
result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17
result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output);

-- n16_MUX_uxn_opcodes_h_l2929_c7_b2e1
n16_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1
tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1
result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output);

-- n16_MUX_uxn_opcodes_h_l2934_c7_14d9
n16_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9
tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output);

-- n16_MUX_uxn_opcodes_h_l2937_c7_e8da
n16_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da
tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da
result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da
result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da
result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da
result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8
BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_left,
BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_right,
BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc
BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_left,
BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_right,
BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97
BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_left,
BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_right,
BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b
BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_left,
BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_right,
BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output);

-- MUX_uxn_opcodes_h_l2942_c32_e4a3
MUX_uxn_opcodes_h_l2942_c32_e4a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2942_c32_e4a3_cond,
MUX_uxn_opcodes_h_l2942_c32_e4a3_iftrue,
MUX_uxn_opcodes_h_l2942_c32_e4a3_iffalse,
MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d
result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c
CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_x,
CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_left,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_right,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec
result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec
result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067
CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output,
 n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output,
 n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output,
 n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output,
 n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output,
 n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output,
 n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output,
 n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output,
 n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output,
 n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output,
 MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_2c91 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2912_c3_d03f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_a50a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2920_c3_a8c1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2924_c3_a4de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2927_c3_0c20 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2932_c3_9267 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2935_c3_d74a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2947_c3_7fc9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2948_c24_84d2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2951_c3_be2f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2952_c24_13b7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2923_l2938_l2915_l2930_DUPLICATE_5cb6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2950_l2937_DUPLICATE_1fb3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2901_l2959_DUPLICATE_def2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_a50a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2917_c3_a50a;
     VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2924_c3_a4de := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2924_c3_a4de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2935_c3_d74a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2935_c3_d74a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2927_c3_0c20 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2927_c3_0c20;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2932_c3_9267 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2932_c3_9267;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2912_c3_d03f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2912_c3_d03f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2920_c3_a8c1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2920_c3_a8c1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_2c91 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_2c91;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_right := to_unsigned(11, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2951_c3_be2f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2951_c3_be2f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2947_c3_7fc9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2947_c3_7fc9;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := tmp16;
     -- BIN_OP_AND[uxn_opcodes_h_l2942_c32_8a97] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_left;
     BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output := BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2923_l2938_l2915_l2930_DUPLICATE_5cb6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2923_l2938_l2915_l2930_DUPLICATE_5cb6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_72f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_fc9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_8d1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_4b3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_1b13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_845a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_8967] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2948_c24_84d2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2948_c24_84d2_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_c630] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2952_c34_5d5c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output := CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_b7fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_56a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c6_0c20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_421b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2950_l2937_DUPLICATE_1fb3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2950_l2937_DUPLICATE_1fb3_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2942_c32_8a97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c6_0c20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_1b13_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_fc9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_421b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_b7fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_72f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_56a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_8967_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_8d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_c630_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_4b3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_845a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2923_l2938_l2915_l2930_DUPLICATE_5cb6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2923_l2938_l2915_l2930_DUPLICATE_5cb6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2923_l2938_l2915_l2930_DUPLICATE_5cb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2948_c24_84d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_6b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2954_l2922_l2950_l2919_l2944_l2914_l2937_DUPLICATE_45c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2919_l2944_l2914_DUPLICATE_dd6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2911_l2934_l2929_l2926_l2922_l2919_l2914_l2937_DUPLICATE_89fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2954_l2922_l2950_l2919_l2914_l2937_DUPLICATE_ad47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2950_l2937_DUPLICATE_1fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2950_l2937_DUPLICATE_1fb3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2911_l2934_l2905_l2929_l2926_l2922_l2950_l2919_l2914_l2937_DUPLICATE_59b2_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2923_c3_0cd9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_left;
     BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output := BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2954_c7_87ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2954_c7_87ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2942_c32_e44b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_left;
     BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output := BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_0e74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2950_c7_375d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2952_c24_13b7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2952_c24_13b7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2952_c34_5d5c_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2938_c3_69f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_left;
     BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output := BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c7_b83b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2942_c32_e44b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2923_c3_0cd9_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2938_c3_69f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2952_c24_13b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2931_l2916_DUPLICATE_9067_return_output;
     VAR_printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_0e74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2954_c7_87ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2950_c7_375d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;

     -- printf_uxn_opcodes_h_l2906_c3_e678[uxn_opcodes_h_l2906_c3_e678] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2906_c3_e678_uxn_opcodes_h_l2906_c3_e678_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_MINUS[uxn_opcodes_h_l2939_c11_eddc] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2950_c7_375d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- t16_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c7_b83b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2950_c7_375d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;

     -- MUX[uxn_opcodes_h_l2942_c32_e4a3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2942_c32_e4a3_cond <= VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_cond;
     MUX_uxn_opcodes_h_l2942_c32_e4a3_iftrue <= VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_iftrue;
     MUX_uxn_opcodes_h_l2942_c32_e4a3_iffalse <= VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output := MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2939_c11_eddc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue := VAR_MUX_uxn_opcodes_h_l2942_c32_e4a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2950_c7_375d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     -- n16_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- t16_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     t16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     t16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c7_b83b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2944_c7_b83b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c7_b83b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c7_b83b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- n16_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2937_c7_e8da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2937_c7_e8da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2934_c7_14d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- t16_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2934_c7_14d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- n16_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     t16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     t16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2929_c7_b2e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2929_c7_b2e1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     n16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     n16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2926_c7_5c17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output := result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2926_c7_5c17_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     -- n16_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2922_c7_6b7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2922_c7_6b7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2919_c7_144a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2919_c7_144a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     n16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     n16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2914_c7_b1ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2914_c7_b1ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2911_c7_24e6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2911_c7_24e6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2905_c2_2832] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2901_l2959_DUPLICATE_def2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2901_l2959_DUPLICATE_def2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2905_c2_2832_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2905_c2_2832_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2901_l2959_DUPLICATE_def2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2901_l2959_DUPLICATE_def2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
