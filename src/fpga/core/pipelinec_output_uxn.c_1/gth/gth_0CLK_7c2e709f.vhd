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
-- Submodules: 65
entity gth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_7c2e709f;
architecture arch of gth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_704b]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1476_c1_1063]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1476_c2_9603]
signal t8_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1476_c2_9603]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1476_c2_9603]
signal n8_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1477_c3_512b[uxn_opcodes_h_l1477_c3_512b]
signal printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_cc6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1482_c7_c9b7]
signal n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_18cf]
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1485_c7_508f]
signal t8_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c7_508f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1485_c7_508f]
signal n8_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_53a8]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1489_c7_7dc6]
signal n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_fd98]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1492_c7_e8fb]
signal n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1496_c32_e4a7]
signal BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1496_c32_c598]
signal BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1496_c32_6861]
signal MUX_uxn_opcodes_h_l1496_c32_6861_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1496_c32_6861_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1496_c32_6861_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1496_c32_6861_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_c13b]
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1498_c7_493e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1498_c7_493e]
signal result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_493e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_493e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_493e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1502_c24_b0e1]
signal BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1502_c24_8ae8]
signal MUX_uxn_opcodes_h_l1502_c24_8ae8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1502_c24_8ae8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1502_c24_8ae8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1504_c11_d740]
signal BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1504_c7_47d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1504_c7_47d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output);

-- t8_MUX_uxn_opcodes_h_l1476_c2_9603
t8_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
t8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
t8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603
result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603
result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- n8_MUX_uxn_opcodes_h_l1476_c2_9603
n8_MUX_uxn_opcodes_h_l1476_c2_9603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1476_c2_9603_cond,
n8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue,
n8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse,
n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

-- printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b
printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b : entity work.printf_uxn_opcodes_h_l1477_c3_512b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output);

-- t8_MUX_uxn_opcodes_h_l1482_c7_c9b7
t8_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7
result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- n8_MUX_uxn_opcodes_h_l1482_c7_c9b7
n8_MUX_uxn_opcodes_h_l1482_c7_c9b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond,
n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue,
n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse,
n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_left,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_right,
BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output);

-- t8_MUX_uxn_opcodes_h_l1485_c7_508f
t8_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
t8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
t8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- n8_MUX_uxn_opcodes_h_l1485_c7_508f
n8_MUX_uxn_opcodes_h_l1485_c7_508f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1485_c7_508f_cond,
n8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue,
n8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse,
n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6
result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- n8_MUX_uxn_opcodes_h_l1489_c7_7dc6
n8_MUX_uxn_opcodes_h_l1489_c7_7dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond,
n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue,
n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse,
n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- n8_MUX_uxn_opcodes_h_l1492_c7_e8fb
n8_MUX_uxn_opcodes_h_l1492_c7_e8fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond,
n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue,
n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse,
n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7
BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_left,
BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_right,
BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598
BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_left,
BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_right,
BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output);

-- MUX_uxn_opcodes_h_l1496_c32_6861
MUX_uxn_opcodes_h_l1496_c32_6861 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1496_c32_6861_cond,
MUX_uxn_opcodes_h_l1496_c32_6861_iftrue,
MUX_uxn_opcodes_h_l1496_c32_6861_iffalse,
MUX_uxn_opcodes_h_l1496_c32_6861_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_left,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_right,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e
result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1
BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_left,
BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_right,
BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output);

-- MUX_uxn_opcodes_h_l1502_c24_8ae8
MUX_uxn_opcodes_h_l1502_c24_8ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1502_c24_8ae8_cond,
MUX_uxn_opcodes_h_l1502_c24_8ae8_iftrue,
MUX_uxn_opcodes_h_l1502_c24_8ae8_iffalse,
MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_left,
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_right,
BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7
result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output,
 t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output,
 t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output,
 t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output,
 MUX_uxn_opcodes_h_l1496_c32_6861_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output,
 MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_66de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_8a98 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_2879 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_49e7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1496_c32_6861_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1496_c32_6861_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1496_c32_6861_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1496_c32_6861_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_3ab0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1492_DUPLICATE_7e48_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1509_l1472_DUPLICATE_dcfd_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_8a98 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1483_c3_8a98;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_3ab0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_3ab0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_2879 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_2879;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1496_c32_6861_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_66de := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_66de;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1496_c32_6861_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_49e7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_49e7;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_fd98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_c13b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_704b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1492_DUPLICATE_7e48 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1492_DUPLICATE_7e48_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_53a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1482_c11_cc6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1485_c11_18cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1504_c11_d740] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_left;
     BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output := BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1496_c32_e4a7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_left;
     BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output := BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1502_c24_b0e1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_left;
     BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output := BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1496_c32_e4a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_704b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1482_c11_cc6a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1485_c11_18cf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_53a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_fd98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_c13b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1504_c11_d740_return_output;
     VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1502_c24_b0e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_DUPLICATE_056d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1504_DUPLICATE_54e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1498_l1489_l1485_l1482_l1476_DUPLICATE_1416_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1489_l1482_l1492_l1485_DUPLICATE_3e68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1489_l1485_l1482_l1476_l1504_DUPLICATE_7816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1492_DUPLICATE_7e48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1492_DUPLICATE_7e48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1498_l1492_l1489_l1485_l1482_l1476_DUPLICATE_e173_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_493e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     t8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     t8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1498_c7_493e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1504_c7_47d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1476_c1_1063] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output;

     -- MUX[uxn_opcodes_h_l1502_c24_8ae8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1502_c24_8ae8_cond <= VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_cond;
     MUX_uxn_opcodes_h_l1502_c24_8ae8_iftrue <= VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_iftrue;
     MUX_uxn_opcodes_h_l1502_c24_8ae8_iffalse <= VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output := MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1496_c32_c598] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_left;
     BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output := BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1504_c7_47d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1496_c32_6861_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1496_c32_c598_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue := VAR_MUX_uxn_opcodes_h_l1502_c24_8ae8_return_output;
     VAR_printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1476_c1_1063_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1504_c7_47d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     -- n8_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_493e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_493e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1498_c7_493e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- printf_uxn_opcodes_h_l1477_c3_512b[uxn_opcodes_h_l1477_c3_512b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1477_c3_512b_uxn_opcodes_h_l1477_c3_512b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- MUX[uxn_opcodes_h_l1496_c32_6861] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1496_c32_6861_cond <= VAR_MUX_uxn_opcodes_h_l1496_c32_6861_cond;
     MUX_uxn_opcodes_h_l1496_c32_6861_iftrue <= VAR_MUX_uxn_opcodes_h_l1496_c32_6861_iftrue;
     MUX_uxn_opcodes_h_l1496_c32_6861_iffalse <= VAR_MUX_uxn_opcodes_h_l1496_c32_6861_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1496_c32_6861_return_output := MUX_uxn_opcodes_h_l1496_c32_6861_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue := VAR_MUX_uxn_opcodes_h_l1496_c32_6861_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1498_c7_493e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     n8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     n8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     t8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     t8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1492_c7_e8fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1492_c7_e8fb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_7dc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1489_c7_7dc6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- n8_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     n8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     n8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1485_c7_508f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1485_c7_508f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1482_c7_c9b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1482_c7_c9b7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_9603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1509_l1472_DUPLICATE_dcfd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1509_l1472_DUPLICATE_dcfd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_9603_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1476_c2_9603_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1509_l1472_DUPLICATE_dcfd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1509_l1472_DUPLICATE_dcfd_return_output;
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
