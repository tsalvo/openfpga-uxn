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
-- Submodules: 66
entity div_0CLK_f6fa2c7d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_f6fa2c7d;
architecture arch of div_0CLK_f6fa2c7d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2348_c6_9415]
signal BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2348_c1_9008]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2348_c2_f3dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2349_c3_6037[uxn_opcodes_h_l2349_c3_6037]
signal printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2354_c11_1852]
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2354_c7_c333]
signal t8_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2354_c7_c333]
signal n8_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c7_c333]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_9038]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2357_c7_4762]
signal t8_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2357_c7_4762]
signal n8_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_4762]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_985b]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2361_c7_209d]
signal n8_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_209d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_a507]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_4aa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2368_c32_e735]
signal BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2368_c32_ae24]
signal BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2368_c32_52b0]
signal MUX_uxn_opcodes_h_l2368_c32_52b0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2368_c32_52b0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2368_c32_52b0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2368_c32_52b0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2370_c11_b090]
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2370_c7_28de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2370_c7_28de]
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2370_c7_28de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2370_c7_28de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2370_c7_28de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2374_c24_02bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2374_c38_68d7]
signal BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l2374_c24_b032]
signal MUX_uxn_opcodes_h_l2374_c24_b032_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2374_c24_b032_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2374_c24_b032_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2374_c24_b032_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_5ebd]
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_7897]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_7897]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415
BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_left,
BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_right,
BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output);

-- t8_MUX_uxn_opcodes_h_l2348_c2_f3dc
t8_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- n8_MUX_uxn_opcodes_h_l2348_c2_f3dc
n8_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

-- printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037
printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037 : entity work.printf_uxn_opcodes_h_l2349_c3_6037_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_left,
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_right,
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output);

-- t8_MUX_uxn_opcodes_h_l2354_c7_c333
t8_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
t8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
t8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- n8_MUX_uxn_opcodes_h_l2354_c7_c333
n8_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
n8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
n8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333
result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333
result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output);

-- t8_MUX_uxn_opcodes_h_l2357_c7_4762
t8_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
t8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
t8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- n8_MUX_uxn_opcodes_h_l2357_c7_4762
n8_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
n8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
n8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output);

-- n8_MUX_uxn_opcodes_h_l2361_c7_209d
n8_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
n8_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
n8_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output);

-- n8_MUX_uxn_opcodes_h_l2364_c7_4aa1
n8_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735
BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_left,
BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_right,
BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24
BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_left,
BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_right,
BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output);

-- MUX_uxn_opcodes_h_l2368_c32_52b0
MUX_uxn_opcodes_h_l2368_c32_52b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2368_c32_52b0_cond,
MUX_uxn_opcodes_h_l2368_c32_52b0_iftrue,
MUX_uxn_opcodes_h_l2368_c32_52b0_iffalse,
MUX_uxn_opcodes_h_l2368_c32_52b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_left,
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_right,
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_cond,
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc
BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7
BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7 : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_left,
BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_right,
BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output);

-- MUX_uxn_opcodes_h_l2374_c24_b032
MUX_uxn_opcodes_h_l2374_c24_b032 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2374_c24_b032_cond,
MUX_uxn_opcodes_h_l2374_c24_b032_iftrue,
MUX_uxn_opcodes_h_l2374_c24_b032_iffalse,
MUX_uxn_opcodes_h_l2374_c24_b032_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_left,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_right,
BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output,
 t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output,
 t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output,
 t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output,
 n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output,
 n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output,
 MUX_uxn_opcodes_h_l2368_c32_52b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output,
 MUX_uxn_opcodes_h_l2374_c24_b032_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_db58 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_bcfa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_59a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_1c8a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_0dfa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2374_c24_b032_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2374_c24_b032_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2374_c24_b032_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2374_c24_b032_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_l2370_DUPLICATE_5234_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2344_l2381_DUPLICATE_ec47_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2374_c24_b032_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_bcfa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_bcfa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_0dfa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2373_c3_0dfa;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_1c8a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_1c8a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_db58 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_db58;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_59a2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_59a2;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2354_c11_1852] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_left;
     BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output := BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2348_c6_9415] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_left;
     BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output := BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2374_c38_68d7] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_left;
     BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output := BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2368_c32_e735] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_left;
     BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output := BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_l2370_DUPLICATE_5234 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_l2370_DUPLICATE_5234_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_a507] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2374_c24_02bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2370_c11_b090] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_left;
     BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output := BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2376_c11_5ebd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_985b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_9038] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c32_e735_return_output;
     VAR_MUX_uxn_opcodes_h_l2374_c24_b032_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2374_c38_68d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2348_c6_9415_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_1852_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_9038_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_985b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_a507_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_b090_return_output;
     VAR_MUX_uxn_opcodes_h_l2374_c24_b032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2374_c24_02bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2376_c11_5ebd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2364_l2361_DUPLICATE_5edf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2357_l2354_l2376_l2370_l2364_l2361_DUPLICATE_ab89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2361_DUPLICATE_f8ea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2364_l2357_l2361_l2354_DUPLICATE_e2e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2376_l2364_l2361_DUPLICATE_6424_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_l2370_DUPLICATE_5234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_l2370_DUPLICATE_5234_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2357_l2354_l2348_l2370_l2364_l2361_DUPLICATE_03ec_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2370_c7_28de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2370_c7_28de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;

     -- n8_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2376_c7_7897] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2348_c1_9008] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2368_c32_ae24] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_left;
     BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output := BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output;

     -- t8_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     t8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     t8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2376_c7_7897] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output;

     -- MUX[uxn_opcodes_h_l2374_c24_b032] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2374_c24_b032_cond <= VAR_MUX_uxn_opcodes_h_l2374_c24_b032_cond;
     MUX_uxn_opcodes_h_l2374_c24_b032_iftrue <= VAR_MUX_uxn_opcodes_h_l2374_c24_b032_iftrue;
     MUX_uxn_opcodes_h_l2374_c24_b032_iffalse <= VAR_MUX_uxn_opcodes_h_l2374_c24_b032_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2374_c24_b032_return_output := MUX_uxn_opcodes_h_l2374_c24_b032_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2368_c32_ae24_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue := VAR_MUX_uxn_opcodes_h_l2374_c24_b032_return_output;
     VAR_printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2348_c1_9008_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2376_c7_7897_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2376_c7_7897_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- printf_uxn_opcodes_h_l2349_c3_6037[uxn_opcodes_h_l2349_c3_6037] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2349_c3_6037_uxn_opcodes_h_l2349_c3_6037_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     t8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     t8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- MUX[uxn_opcodes_h_l2368_c32_52b0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2368_c32_52b0_cond <= VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_cond;
     MUX_uxn_opcodes_h_l2368_c32_52b0_iftrue <= VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_iftrue;
     MUX_uxn_opcodes_h_l2368_c32_52b0_iffalse <= VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_return_output := MUX_uxn_opcodes_h_l2368_c32_52b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2370_c7_28de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2370_c7_28de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;

     -- n8_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     n8_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     n8_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2370_c7_28de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output := result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue := VAR_MUX_uxn_opcodes_h_l2368_c32_52b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_28de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_4aa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     n8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     n8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c7_4aa1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     n8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     n8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_209d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2361_c7_209d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- n8_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_4762] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2357_c7_4762_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2354_c7_c333] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output := result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2354_c7_c333_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2348_c2_f3dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2344_l2381_DUPLICATE_ec47 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2344_l2381_DUPLICATE_ec47_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2348_c2_f3dc_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2344_l2381_DUPLICATE_ec47_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2344_l2381_DUPLICATE_ec47_return_output;
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
