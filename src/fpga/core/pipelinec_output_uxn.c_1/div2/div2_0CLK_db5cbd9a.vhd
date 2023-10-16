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
-- Submodules: 109
entity div2_0CLK_db5cbd9a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_db5cbd9a;
architecture arch of div2_0CLK_db5cbd9a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2221_c6_ae19]
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2221_c1_4b79]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal n16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2221_c2_9dda]
signal t16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2222_c3_1af6[uxn_opcodes_h_l2222_c3_1af6]
signal printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_b01b]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2226_c7_c5cb]
signal t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_b0ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal n16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2229_c7_85b1]
signal t16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_e3fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2234_c7_2d6c]
signal t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_1a9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal n16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2237_c7_cce9]
signal t16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2238_c3_bcbf]
signal BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_b745]
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2241_c7_e079]
signal n16_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2241_c7_e079]
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_e079]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_e079]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_e079]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_e079]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_e079]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2241_c7_e079]
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_caf7]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2244_c7_8923]
signal n16_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2244_c7_8923]
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_8923]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_8923]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_8923]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_8923]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_8923]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2244_c7_8923]
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2249_c11_0375]
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2249_c7_af85]
signal n16_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2249_c7_af85]
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2249_c7_af85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2249_c7_af85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2249_c7_af85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2249_c7_af85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2249_c7_af85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2249_c7_af85]
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_67ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2252_c7_2006]
signal n16_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2252_c7_2006]
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_2006]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_2006]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_2006]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_2006]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_2006]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2252_c7_2006]
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2253_c3_57fd]
signal BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2254_c11_7075]
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2254_c26_996a]
signal BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2254_c11_4344]
signal MUX_uxn_opcodes_h_l2254_c11_4344_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2254_c11_4344_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2254_c11_4344_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2254_c11_4344_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2256_c30_9213]
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2261_c11_dcf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2261_c7_a6ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2261_c7_a6ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2261_c7_a6ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2261_c7_a6ef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2261_c7_a6ef]
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2264_c31_f319]
signal CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2266_c11_d4b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2266_c7_2a8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2266_c7_2a8e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_left,
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_right,
BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output);

-- n16_MUX_uxn_opcodes_h_l2221_c2_9dda
n16_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda
tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- t16_MUX_uxn_opcodes_h_l2221_c2_9dda
t16_MUX_uxn_opcodes_h_l2221_c2_9dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond,
t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue,
t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse,
t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

-- printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6
printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6 : entity work.printf_uxn_opcodes_h_l2222_c3_1af6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c7_c5cb
n16_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb
tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- t16_MUX_uxn_opcodes_h_l2226_c7_c5cb
t16_MUX_uxn_opcodes_h_l2226_c7_c5cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond,
t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue,
t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse,
t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output);

-- n16_MUX_uxn_opcodes_h_l2229_c7_85b1
n16_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1
tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- t16_MUX_uxn_opcodes_h_l2229_c7_85b1
t16_MUX_uxn_opcodes_h_l2229_c7_85b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond,
t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue,
t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse,
t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output);

-- n16_MUX_uxn_opcodes_h_l2234_c7_2d6c
n16_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c
tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- t16_MUX_uxn_opcodes_h_l2234_c7_2d6c
t16_MUX_uxn_opcodes_h_l2234_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond,
t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue,
t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse,
t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output);

-- n16_MUX_uxn_opcodes_h_l2237_c7_cce9
n16_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9
tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- t16_MUX_uxn_opcodes_h_l2237_c7_cce9
t16_MUX_uxn_opcodes_h_l2237_c7_cce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond,
t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue,
t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse,
t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf
BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_left,
BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_right,
BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_left,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_right,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output);

-- n16_MUX_uxn_opcodes_h_l2241_c7_e079
n16_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
n16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
n16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2241_c7_e079
tmp16_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_cond,
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output);

-- n16_MUX_uxn_opcodes_h_l2244_c7_8923
n16_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
n16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
n16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2244_c7_8923
tmp16_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_cond,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_left,
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_right,
BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output);

-- n16_MUX_uxn_opcodes_h_l2249_c7_af85
n16_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
n16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
n16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2249_c7_af85
tmp16_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_cond,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output);

-- n16_MUX_uxn_opcodes_h_l2252_c7_2006
n16_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
n16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
n16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2252_c7_2006
tmp16_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_cond,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd
BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_left,
BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_right,
BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_left,
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_right,
BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_left,
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_right,
BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output);

-- MUX_uxn_opcodes_h_l2254_c11_4344
MUX_uxn_opcodes_h_l2254_c11_4344 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2254_c11_4344_cond,
MUX_uxn_opcodes_h_l2254_c11_4344_iftrue,
MUX_uxn_opcodes_h_l2254_c11_4344_iffalse,
MUX_uxn_opcodes_h_l2254_c11_4344_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2256_c30_9213
sp_relative_shift_uxn_opcodes_h_l2256_c30_9213 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_ins,
sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_x,
sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_y,
sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond,
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2264_c31_f319
CONST_SR_8_uxn_opcodes_h_l2264_c31_f319 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_x,
CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4
CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output,
 n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output,
 n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output,
 n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output,
 n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output,
 n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output,
 n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output,
 n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output,
 n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output,
 MUX_uxn_opcodes_h_l2254_c11_4344_return_output,
 sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output,
 CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2223_c3_d2fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2227_c3_0742 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_928e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_da70 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_8f4b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_9b68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_d5cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_4c2a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_6c31 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_4344_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_4344_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_4344_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c11_4344_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2259_c21_b29f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_23ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2261_c7_a6ef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_cbec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2253_l2245_l2230_l2238_DUPLICATE_09ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2271_l2217_DUPLICATE_6b15_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_8f4b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2239_c3_8f4b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2223_c3_d2fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2223_c3_d2fe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_928e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2232_c3_928e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2227_c3_0742 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2227_c3_0742;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_6c31 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2258_c3_6c31;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_da70 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2235_c3_da70;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_23ac := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2263_c3_23ac;
     VAR_MUX_uxn_opcodes_h_l2254_c11_4344_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_d5cd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2247_c3_d5cd;
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_4c2a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2250_c3_4c2a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_9b68 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_9b68;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_e3fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2237_c11_1a9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2261_c11_dcf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2229_c11_b0ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2221_c6_ae19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_left;
     BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output := BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_b745] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_left;
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output := BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2256_c30_9213] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_ins;
     sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_x;
     sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output := sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2253_l2245_l2230_l2238_DUPLICATE_09ac LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2253_l2245_l2230_l2238_DUPLICATE_09ac_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2266_c11_d4b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_caf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2261_c7_a6ef] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2261_c7_a6ef_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2249_c11_0375] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_left;
     BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output := BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_b01b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2252_c11_67ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2264_c31_f319] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output := CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2254_c11_7075] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_left;
     BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output := BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c6_ae19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b01b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2229_c11_b0ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_e3fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2237_c11_1a9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_b745_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_caf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2249_c11_0375_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2252_c11_67ea_return_output;
     VAR_MUX_uxn_opcodes_h_l2254_c11_4344_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2254_c11_7075_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2261_c11_dcf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2266_c11_d4b7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2253_l2245_l2230_l2238_DUPLICATE_09ac_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2253_l2245_l2230_l2238_DUPLICATE_09ac_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2253_l2245_l2230_l2238_DUPLICATE_09ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2229_l2252_l2226_l2249_l2221_l2244_DUPLICATE_0499_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2252_l2226_l2249_l2244_DUPLICATE_2ddf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_534a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2241_l2237_l2266_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_54a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2241_l2237_l2234_l2261_l2229_l2226_l2249_l2221_l2244_DUPLICATE_bc6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2261_c7_a6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2256_c30_9213_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2221_c1_4b79] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2238_c3_bcbf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_left;
     BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output := BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2264_c21_cbec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_cbec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2264_c31_f319_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2253_c3_57fd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_left;
     BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output := BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2261_c7_a6ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2266_c7_2a8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2266_c7_2a8e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2261_c7_a6ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2238_c3_bcbf_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2253_c3_57fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2264_c21_cbec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2231_l2246_DUPLICATE_0df4_return_output;
     VAR_printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2221_c1_4b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2266_c7_2a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- printf_uxn_opcodes_h_l2222_c3_1af6[uxn_opcodes_h_l2222_c3_1af6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2222_c3_1af6_uxn_opcodes_h_l2222_c3_1af6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2261_c7_a6ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2261_c7_a6ef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- n16_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     n16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     n16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2254_c26_996a] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_left;
     BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output := BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2261_c7_a6ef] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output := result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2254_c11_4344_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2254_c26_996a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2261_c7_a6ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- n16_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     n16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     n16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- MUX[uxn_opcodes_h_l2254_c11_4344] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2254_c11_4344_cond <= VAR_MUX_uxn_opcodes_h_l2254_c11_4344_cond;
     MUX_uxn_opcodes_h_l2254_c11_4344_iftrue <= VAR_MUX_uxn_opcodes_h_l2254_c11_4344_iftrue;
     MUX_uxn_opcodes_h_l2254_c11_4344_iffalse <= VAR_MUX_uxn_opcodes_h_l2254_c11_4344_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2254_c11_4344_return_output := MUX_uxn_opcodes_h_l2254_c11_4344_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- t16_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := VAR_MUX_uxn_opcodes_h_l2254_c11_4344_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- n16_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     n16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     n16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2259_c21_b29f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2259_c21_b29f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2254_c11_4344_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- t16_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2259_c21_b29f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     -- t16_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     n16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     n16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2252_c7_2006] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output := result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2252_c7_2006_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- t16_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2249_c7_af85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output := result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;

     -- n16_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2249_c7_af85_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2244_c7_8923] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output := result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2244_c7_8923_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2241_c7_e079] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output := result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2241_c7_e079_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2237_c7_cce9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2237_c7_cce9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_2d6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_2d6c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2229_c7_85b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2229_c7_85b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_c5cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- Submodule level 13
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_c5cb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2221_c2_9dda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output := result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2271_l2217_DUPLICATE_6b15 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2271_l2217_DUPLICATE_6b15_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c2_9dda_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2271_l2217_DUPLICATE_6b15_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2271_l2217_DUPLICATE_6b15_return_output;
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
