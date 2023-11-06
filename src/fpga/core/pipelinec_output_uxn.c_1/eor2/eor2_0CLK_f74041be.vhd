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
-- Submodules: 79
entity eor2_0CLK_f74041be is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_f74041be;
architecture arch of eor2_0CLK_f74041be is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_e29c]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_d9fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal n16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal t16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c2_79fa]
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1068_c3_4c96[uxn_opcodes_h_l1068_c3_4c96]
signal printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_f511]
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1072_c7_167c]
signal n16_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_167c]
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_167c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_167c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_167c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_167c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_167c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1072_c7_167c]
signal t16_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1072_c7_167c]
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_409d]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1075_c7_9cb7]
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_b6ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal n16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal t16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1080_c7_26f7]
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1081_c3_857e]
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_3012]
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal n16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1084_c7_63f3]
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_11a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1088_c7_493d]
signal n16_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1088_c7_493d]
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_493d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_493d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_493d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_493d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_493d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1088_c7_493d]
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1089_c3_af53]
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1090_c11_1a6b]
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1092_c30_b5b0]
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_81b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_ce2e]
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_ce2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_ce2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_ce2e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_ce2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1100_c31_e9e8]
signal CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_8e59]
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_659b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_659b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c2_79fa
n16_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- t16_MUX_uxn_opcodes_h_l1067_c2_79fa
t16_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa
tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

-- printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96
printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96 : entity work.printf_uxn_opcodes_h_l1068_c3_4c96_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_left,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_right,
BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output);

-- n16_MUX_uxn_opcodes_h_l1072_c7_167c
n16_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
n16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
n16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- t16_MUX_uxn_opcodes_h_l1072_c7_167c
t16_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
t16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
t16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1072_c7_167c
tmp16_MUX_uxn_opcodes_h_l1072_c7_167c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_cond,
tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output);

-- n16_MUX_uxn_opcodes_h_l1075_c7_9cb7
n16_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- t16_MUX_uxn_opcodes_h_l1075_c7_9cb7
t16_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7
tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond,
tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output);

-- n16_MUX_uxn_opcodes_h_l1080_c7_26f7
n16_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- t16_MUX_uxn_opcodes_h_l1080_c7_26f7
t16_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7
tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond,
tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e
BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_left,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_right,
BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_left,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_right,
BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output);

-- n16_MUX_uxn_opcodes_h_l1084_c7_63f3
n16_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3
tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond,
tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1088_c7_493d
n16_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
n16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
n16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1088_c7_493d
tmp16_MUX_uxn_opcodes_h_l1088_c7_493d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_cond,
tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53
BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_left,
BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_right,
BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_left,
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_right,
BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0
sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_ins,
sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_x,
sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_y,
sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8
CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_x,
CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_left,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_right,
BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output,
 n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output,
 n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output,
 n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output,
 n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output,
 n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output,
 CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_6bd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_a449 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_8f29 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_6919 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_c619 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_8d54_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6ea4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_71e7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1089_l1081_l1085_DUPLICATE_b97d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_ea95_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1063_l1107_DUPLICATE_4c40_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_6919 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1082_c3_6919;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6ea4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1099_c3_6ea4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_6bd0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1069_c3_6bd0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_c619 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1094_c3_c619;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_a449 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1073_c3_a449;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_8f29 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_8f29;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1088_c11_11a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c6_e29c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1080_c11_b6ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_409d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1092_c30_b5b0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_ins;
     sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_x;
     sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output := sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1089_l1081_l1085_DUPLICATE_b97d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1089_l1081_l1085_DUPLICATE_b97d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1102_c11_8e59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1072_c11_f511] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_left;
     BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output := BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1100_c31_e9e8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output := CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_ea95 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_ea95_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1097_c11_81b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1084_c11_3012] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_left;
     BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output := BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c6_e29c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1072_c11_f511_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_409d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1080_c11_b6ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1084_c11_3012_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1088_c11_11a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1097_c11_81b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1102_c11_8e59_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1089_l1081_l1085_DUPLICATE_b97d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1089_l1081_l1085_DUPLICATE_b97d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1076_l1089_l1081_l1085_DUPLICATE_b97d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1067_l1088_l1084_DUPLICATE_0065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1088_l1084_DUPLICATE_29cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_ee8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1080_l1075_l1102_l1072_l1097_l1067_l1084_DUPLICATE_50fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_ea95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1097_l1084_DUPLICATE_ea95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1080_l1075_l1072_l1097_l1067_l1084_DUPLICATE_3d14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1092_c30_b5b0_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1100_c21_71e7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_71e7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1100_c31_e9e8_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1102_c7_659b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1102_c7_659b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1097_c7_ce2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1067_c1_d9fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1097_c7_ce2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1089_c3_af53] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_left;
     BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output := BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1081_c3_857e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_left;
     BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output := BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1081_c3_857e_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1089_c3_af53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1100_c21_71e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1077_l1086_DUPLICATE_a84c_return_output;
     VAR_printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1067_c1_d9fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1102_c7_659b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1102_c7_659b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1097_c7_ce2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1097_c7_ce2e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1097_c7_ce2e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     n16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     n16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- printf_uxn_opcodes_h_l1068_c3_4c96[uxn_opcodes_h_l1068_c3_4c96] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1068_c3_4c96_uxn_opcodes_h_l1068_c3_4c96_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_XOR[uxn_opcodes_h_l1090_c11_1a6b] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_left;
     BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output := BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1097_c7_ce2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1095_c21_8d54] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_8d54_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1090_c11_1a6b_return_output);

     -- n16_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1095_c21_8d54_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1088_c7_493d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     t16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     t16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1088_c7_493d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     -- t16_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1084_c7_63f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1084_c7_63f3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     n16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     n16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1080_c7_26f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1080_c7_26f7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1075_c7_9cb7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1075_c7_9cb7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1072_c7_167c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1072_c7_167c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1067_c2_79fa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1063_l1107_DUPLICATE_4c40 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1063_l1107_DUPLICATE_4c40_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c2_79fa_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1063_l1107_DUPLICATE_4c40_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1063_l1107_DUPLICATE_4c40_return_output;
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
