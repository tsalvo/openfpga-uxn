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
-- Submodules: 119
entity swp2_0CLK_37dbf2f3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_37dbf2f3;
architecture arch of swp2_0CLK_37dbf2f3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2824_c6_e235]
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c1_1ddc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal t16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal n16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2824_c2_2b85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2825_c3_c241[uxn_opcodes_h_l2825_c3_c241]
signal printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_6399]
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal t16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal n16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2829_c7_5c46]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_764d]
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2832_c7_9175]
signal t16_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2832_c7_9175]
signal n16_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_9175]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_9175]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_9175]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_9175]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2832_c7_9175]
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_9175]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_46b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal t16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal n16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_ef85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_7858]
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_4d7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2841_c3_9636]
signal BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_a220]
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2844_c7_8638]
signal n16_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2844_c7_8638]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2844_c7_8638]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2844_c7_8638]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2844_c7_8638]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2844_c7_8638]
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2844_c7_8638]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_cfc2]
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal n16_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2847_c7_4f30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_8738]
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal n16_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2852_c7_0d60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_92d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal n16_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2855_c7_40a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2856_c3_417f]
signal BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2858_c32_9261]
signal BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2858_c32_4b6a]
signal BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2858_c32_f360]
signal MUX_uxn_opcodes_h_l2858_c32_f360_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2858_c32_f360_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2858_c32_f360_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2858_c32_f360_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_0673]
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2860_c7_ef22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2860_c7_ef22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2860_c7_ef22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2860_c7_ef22]
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2860_c7_ef22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_593b]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_bae1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_bae1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_bae1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_bae1]
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_bae1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2868_c34_8fa9]
signal CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_5814]
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2870_c7_62f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2870_c7_62f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2870_c7_62f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2870_c7_62f7]
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2870_c7_62f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_a018]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2875_c7_d69d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2875_c7_d69d]
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2875_c7_d69d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2875_c7_d69d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2877_c34_10b3]
signal CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_cdf9]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_b4ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_b4ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_left,
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_right,
BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output);

-- t16_MUX_uxn_opcodes_h_l2824_c2_2b85
t16_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- n16_MUX_uxn_opcodes_h_l2824_c2_2b85
n16_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

-- printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241
printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241 : entity work.printf_uxn_opcodes_h_l2825_c3_c241_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_left,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_right,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output);

-- t16_MUX_uxn_opcodes_h_l2829_c7_5c46
t16_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- n16_MUX_uxn_opcodes_h_l2829_c7_5c46
n16_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_left,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_right,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output);

-- t16_MUX_uxn_opcodes_h_l2832_c7_9175
t16_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
t16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
t16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- n16_MUX_uxn_opcodes_h_l2832_c7_9175
n16_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
n16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
n16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output);

-- t16_MUX_uxn_opcodes_h_l2837_c7_ef85
t16_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- n16_MUX_uxn_opcodes_h_l2837_c7_ef85
n16_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_left,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_right,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output);

-- t16_MUX_uxn_opcodes_h_l2840_c7_4d7d
t16_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- n16_MUX_uxn_opcodes_h_l2840_c7_4d7d
n16_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636
BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_left,
BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_right,
BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_left,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_right,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output);

-- n16_MUX_uxn_opcodes_h_l2844_c7_8638
n16_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
n16_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
n16_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_left,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_right,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output);

-- n16_MUX_uxn_opcodes_h_l2847_c7_4f30
n16_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_left,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_right,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output);

-- n16_MUX_uxn_opcodes_h_l2852_c7_0d60
n16_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output);

-- n16_MUX_uxn_opcodes_h_l2855_c7_40a6
n16_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f
BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_left,
BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_right,
BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261
BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_left,
BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_right,
BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a
BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_left,
BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_right,
BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output);

-- MUX_uxn_opcodes_h_l2858_c32_f360
MUX_uxn_opcodes_h_l2858_c32_f360 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2858_c32_f360_cond,
MUX_uxn_opcodes_h_l2858_c32_f360_iftrue,
MUX_uxn_opcodes_h_l2858_c32_f360_iffalse,
MUX_uxn_opcodes_h_l2858_c32_f360_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_left,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_right,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_cond,
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9
CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_x,
CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_left,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_right,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3
CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_x,
CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4
CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output,
 t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output,
 t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output,
 t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output,
 t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output,
 t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output,
 n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output,
 n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output,
 n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output,
 n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output,
 MUX_uxn_opcodes_h_l2858_c32_f360_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output,
 CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_5cfb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_8104 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_2a0b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_8e7b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_2307 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_2a27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_d5b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2853_c3_7a49 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_f360_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_f360_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_f360_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2858_c32_f360_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_cc6f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_4be0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2867_c3_199f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2868_c24_74bd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_a152 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_e5c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_0853 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2877_c24_e248_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2833_l2848_l2841_l2856_DUPLICATE_b846_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_d973_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2884_l2820_DUPLICATE_c907_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_2307 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_2307;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_2a0b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2835_c3_2a0b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2867_c3_199f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2867_c3_199f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_d5b3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2850_c3_d5b3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_8e7b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_8e7b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_5cfb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_5cfb;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_right := to_unsigned(13, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_2a27 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2845_c3_2a27;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_right := to_unsigned(12, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2853_c3_7a49 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2853_c3_7a49;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_a152 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_a152;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_cc6f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_cc6f;
     VAR_MUX_uxn_opcodes_h_l2858_c32_f360_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l2858_c32_f360_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_0853 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_0853;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_8104 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2830_c3_8104;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_0673] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_left;
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output := BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_764d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_8738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_left;
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output := BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_a018] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_5814] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_left;
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output := BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_7858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_left;
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output := BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2858_c32_9261] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_left;
     BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output := BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_46b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_92d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2873_c24_e5c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_e5c1_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_6399] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_left;
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output := BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2864_c24_4be0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_4be0_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_cfc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2877_c34_10b3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output := CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_a220] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_left;
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output := BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_d973 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_d973_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_cdf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2868_c34_8fa9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output := CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_593b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2833_l2848_l2841_l2856_DUPLICATE_b846 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2833_l2848_l2841_l2856_DUPLICATE_b846_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2824_c6_e235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_left;
     BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output := BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2858_c32_9261_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c6_e235_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_6399_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_764d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_46b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_7858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_a220_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_cfc2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_8738_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_92d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_593b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_5814_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_a018_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_cdf9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2833_l2848_l2841_l2856_DUPLICATE_b846_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2833_l2848_l2841_l2856_DUPLICATE_b846_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2833_l2848_l2841_l2856_DUPLICATE_b846_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_4be0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_e5c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2844_DUPLICATE_080f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2860_l2832_l2855_l2829_l2852_l2879_l2847_l2875_l2844_l2870_DUPLICATE_e422_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2829_l2852_l2824_l2847_l2844_l2870_DUPLICATE_191b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2840_l2866_l2837_l2832_l2855_l2829_l2852_l2879_l2824_l2847_l2875_l2844_l2870_DUPLICATE_b2b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_d973_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2875_l2855_DUPLICATE_d973_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2840_l2837_l2832_l2855_l2829_l2852_l2824_l2847_l2875_l2844_DUPLICATE_86c1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c1_1ddc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2856_c3_417f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_left;
     BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output := BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2879_c7_b4ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2858_c32_4b6a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_left;
     BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output := BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2877_c24_e248] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2877_c24_e248_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2877_c34_10b3_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2841_c3_9636] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_left;
     BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output := BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2868_c24_74bd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2868_c24_74bd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2868_c34_8fa9_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2870_c7_62f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2875_c7_d69d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2879_c7_b4ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2858_c32_f360_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2858_c32_4b6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2841_c3_9636_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2856_c3_417f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2868_c24_74bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2877_c24_e248_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2849_l2834_DUPLICATE_5ee4_return_output;
     VAR_printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_1ddc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2879_c7_b4ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2875_c7_d69d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2875_c7_d69d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_bae1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;

     -- MUX[uxn_opcodes_h_l2858_c32_f360] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2858_c32_f360_cond <= VAR_MUX_uxn_opcodes_h_l2858_c32_f360_cond;
     MUX_uxn_opcodes_h_l2858_c32_f360_iftrue <= VAR_MUX_uxn_opcodes_h_l2858_c32_f360_iftrue;
     MUX_uxn_opcodes_h_l2858_c32_f360_iffalse <= VAR_MUX_uxn_opcodes_h_l2858_c32_f360_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2858_c32_f360_return_output := MUX_uxn_opcodes_h_l2858_c32_f360_return_output;

     -- printf_uxn_opcodes_h_l2825_c3_c241[uxn_opcodes_h_l2825_c3_c241] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2825_c3_c241_uxn_opcodes_h_l2825_c3_c241_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2870_c7_62f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2875_c7_d69d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue := VAR_MUX_uxn_opcodes_h_l2858_c32_f360_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2875_c7_d69d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2870_c7_62f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2870_c7_62f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_bae1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2870_c7_62f7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2860_c7_ef22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2870_c7_62f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2860_c7_ef22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;

     -- n16_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_bae1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_bae1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_bae1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     t16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     t16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_bae1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     -- t16_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2860_c7_ef22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output := result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- n16_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     n16_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     n16_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2860_c7_ef22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2860_c7_ef22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2860_c7_ef22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     -- n16_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2855_c7_40a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2855_c7_40a6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;
     -- n16_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2852_c7_0d60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2852_c7_0d60_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- n16_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     n16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     n16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2847_c7_4f30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2847_c7_4f30_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- n16_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2844_c7_8638] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2844_c7_8638_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_4d7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- n16_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_4d7d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2837_c7_ef85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2837_c7_ef85_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2832_c7_9175] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2832_c7_9175_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2829_c7_5c46] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2829_c7_5c46_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2824_c2_2b85] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output := result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2884_l2820_DUPLICATE_c907 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2884_l2820_DUPLICATE_c907_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2824_c2_2b85_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2884_l2820_DUPLICATE_c907_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2884_l2820_DUPLICATE_c907_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
