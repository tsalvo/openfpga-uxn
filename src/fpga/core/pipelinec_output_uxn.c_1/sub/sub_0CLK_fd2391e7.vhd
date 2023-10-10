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
-- Submodules: 64
entity sub_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_fd2391e7;
architecture arch of sub_0CLK_fd2391e7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2793_c6_9834]
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2793_c1_b7c3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2793_c2_426d]
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2793_c2_426d]
signal t8_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2793_c2_426d]
signal n8_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2794_c3_db58[uxn_opcodes_h_l2794_c3_db58]
signal printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_3037]
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2799_c7_cdfe]
signal n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_9574]
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2802_c7_c5c0]
signal n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2806_c11_9647]
signal BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2806_c7_30a3]
signal n8_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2809_c11_e303]
signal BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2809_c7_d57d]
signal n8_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2813_c32_6d7f]
signal BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2813_c32_ba9b]
signal BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2813_c32_f654]
signal MUX_uxn_opcodes_h_l2813_c32_f654_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2813_c32_f654_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2813_c32_f654_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2813_c32_f654_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2815_c11_0ac7]
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c7_ae7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c7_ae7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c7_ae7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c7_ae7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2815_c7_ae7c]
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2819_c24_2a5c]
signal BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_79b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2821_c7_50b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2821_c7_50b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834
BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_left,
BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_right,
BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d
result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d
result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- t8_MUX_uxn_opcodes_h_l2793_c2_426d
t8_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
t8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
t8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- n8_MUX_uxn_opcodes_h_l2793_c2_426d
n8_MUX_uxn_opcodes_h_l2793_c2_426d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2793_c2_426d_cond,
n8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue,
n8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse,
n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

-- printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58
printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58 : entity work.printf_uxn_opcodes_h_l2794_c3_db58_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_left,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_right,
BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe
result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- t8_MUX_uxn_opcodes_h_l2799_c7_cdfe
t8_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- n8_MUX_uxn_opcodes_h_l2799_c7_cdfe
n8_MUX_uxn_opcodes_h_l2799_c7_cdfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond,
n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue,
n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse,
n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_left,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_right,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- t8_MUX_uxn_opcodes_h_l2802_c7_c5c0
t8_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- n8_MUX_uxn_opcodes_h_l2802_c7_c5c0
n8_MUX_uxn_opcodes_h_l2802_c7_c5c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond,
n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue,
n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse,
n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_left,
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_right,
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3
result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3
result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3
result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- n8_MUX_uxn_opcodes_h_l2806_c7_30a3
n8_MUX_uxn_opcodes_h_l2806_c7_30a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2806_c7_30a3_cond,
n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue,
n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse,
n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303
BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_left,
BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_right,
BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d
result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d
result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d
result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d
result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d
result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- n8_MUX_uxn_opcodes_h_l2809_c7_d57d
n8_MUX_uxn_opcodes_h_l2809_c7_d57d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2809_c7_d57d_cond,
n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue,
n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse,
n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f
BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_left,
BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_right,
BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b
BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_left,
BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_right,
BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output);

-- MUX_uxn_opcodes_h_l2813_c32_f654
MUX_uxn_opcodes_h_l2813_c32_f654 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2813_c32_f654_cond,
MUX_uxn_opcodes_h_l2813_c32_f654_iftrue,
MUX_uxn_opcodes_h_l2813_c32_f654_iffalse,
MUX_uxn_opcodes_h_l2813_c32_f654_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7
BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_left,
BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_right,
BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c
result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c
BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_left,
BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_right,
BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output,
 MUX_uxn_opcodes_h_l2813_c32_f654_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_b7ee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_b142 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2804_c3_ba44 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2807_c3_b165 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2813_c32_f654_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2813_c32_f654_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2813_c32_f654_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2813_c32_f654_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2818_c3_1292 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2815_l2809_DUPLICATE_9fb7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2826_l2789_DUPLICATE_575b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2807_c3_b165 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2807_c3_b165;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2818_c3_1292 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2818_c3_1292;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_b7ee := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2796_c3_b7ee;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2804_c3_ba44 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2804_c3_ba44;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_b142 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2800_c3_b142;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2813_c32_f654_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2813_c32_f654_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_79b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2815_l2809_DUPLICATE_9fb7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2815_l2809_DUPLICATE_9fb7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_9574] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_left;
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output := BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2799_c11_3037] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_left;
     BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output := BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2806_c11_9647] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_left;
     BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output := BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2815_c11_0ac7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2819_c24_2a5c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2813_c32_6d7f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_left;
     BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output := BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2809_c11_e303] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_left;
     BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output := BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2793_c6_9834] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_left;
     BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output := BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2813_c32_6d7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2793_c6_9834_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2799_c11_3037_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_9574_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_9647_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2809_c11_e303_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2815_c11_0ac7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_79b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2819_c24_2a5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2809_DUPLICATE_8e7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2821_l2815_l2809_DUPLICATE_e5da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_DUPLICATE_18bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2806_l2799_l2809_l2802_DUPLICATE_fac8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2821_l2809_DUPLICATE_9114_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2815_l2809_DUPLICATE_9fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2815_l2809_DUPLICATE_9fb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2806_l2802_l2799_l2793_l2815_l2809_DUPLICATE_703b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2821_c7_50b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2813_c32_ba9b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_left;
     BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output := BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2815_c7_ae7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2815_c7_ae7c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2821_c7_50b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2815_c7_ae7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2793_c1_b7c3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2813_c32_f654_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2813_c32_ba9b_return_output;
     VAR_printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2793_c1_b7c3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2821_c7_50b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2815_c7_ae7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2815_c7_ae7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- MUX[uxn_opcodes_h_l2813_c32_f654] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2813_c32_f654_cond <= VAR_MUX_uxn_opcodes_h_l2813_c32_f654_cond;
     MUX_uxn_opcodes_h_l2813_c32_f654_iftrue <= VAR_MUX_uxn_opcodes_h_l2813_c32_f654_iftrue;
     MUX_uxn_opcodes_h_l2813_c32_f654_iffalse <= VAR_MUX_uxn_opcodes_h_l2813_c32_f654_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2813_c32_f654_return_output := MUX_uxn_opcodes_h_l2813_c32_f654_return_output;

     -- printf_uxn_opcodes_h_l2794_c3_db58[uxn_opcodes_h_l2794_c3_db58] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2794_c3_db58_uxn_opcodes_h_l2794_c3_db58_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue := VAR_MUX_uxn_opcodes_h_l2813_c32_f654_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2815_c7_ae7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- t8_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     t8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     t8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2809_c7_d57d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2809_c7_d57d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;
     -- n8_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2806_c7_30a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2806_c7_30a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_c5c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- n8_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     n8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     n8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2802_c7_c5c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2799_c7_cdfe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2799_c7_cdfe_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2793_c2_426d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2826_l2789_DUPLICATE_575b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2826_l2789_DUPLICATE_575b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2793_c2_426d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2793_c2_426d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2826_l2789_DUPLICATE_575b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2826_l2789_DUPLICATE_575b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
