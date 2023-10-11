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
-- Submodules: 59
entity and_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_3220bbf1;
architecture arch of and_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l962_c6_e3c8]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l962_c1_9a32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal n8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal t8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_fb9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l963_c3_3483[uxn_opcodes_h_l963_c3_3483]
signal printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l967_c11_965b]
signal BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l967_c7_94c2]
signal n8_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l967_c7_94c2]
signal t8_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l967_c7_94c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l967_c7_94c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l967_c7_94c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l967_c7_94c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l967_c7_94c2]
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l967_c7_94c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l970_c11_d51b]
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l970_c7_a637]
signal n8_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l970_c7_a637]
signal t8_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_a637]
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l970_c7_a637]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_a637]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_a637]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l970_c7_a637]
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_a637]
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l974_c11_ba9f]
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal n8_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l974_c7_f1dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l977_c11_9d33]
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal n8_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_5b3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l980_c32_e284]
signal BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l980_c32_c3c8]
signal BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l980_c32_fb67]
signal MUX_uxn_opcodes_h_l980_c32_fb67_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l980_c32_fb67_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l980_c32_fb67_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l980_c32_fb67_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l982_c11_5144]
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_ab72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l982_c7_ab72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l982_c7_ab72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l982_c7_ab72]
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_ab72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l986_c24_2cd8]
signal BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l988_c11_e55f]
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_69ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_69ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output);

-- n8_MUX_uxn_opcodes_h_l962_c2_fb9b
n8_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- t8_MUX_uxn_opcodes_h_l962_c2_fb9b
t8_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b
result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

-- printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483
printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483 : entity work.printf_uxn_opcodes_h_l963_c3_3483_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b
BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_left,
BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_right,
BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output);

-- n8_MUX_uxn_opcodes_h_l967_c7_94c2
n8_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
n8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
n8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- t8_MUX_uxn_opcodes_h_l967_c7_94c2
t8_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
t8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
t8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2
result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b
BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_left,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_right,
BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output);

-- n8_MUX_uxn_opcodes_h_l970_c7_a637
n8_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l970_c7_a637_cond,
n8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
n8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- t8_MUX_uxn_opcodes_h_l970_c7_a637
t8_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l970_c7_a637_cond,
t8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
t8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637
result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_cond,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f
BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_left,
BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_right,
BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output);

-- n8_MUX_uxn_opcodes_h_l974_c7_f1dc
n8_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33
BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_left,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_right,
BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output);

-- n8_MUX_uxn_opcodes_h_l977_c7_5b3d
n8_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l980_c32_e284
BIN_OP_AND_uxn_opcodes_h_l980_c32_e284 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_left,
BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_right,
BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8
BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_left,
BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_right,
BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output);

-- MUX_uxn_opcodes_h_l980_c32_fb67
MUX_uxn_opcodes_h_l980_c32_fb67 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l980_c32_fb67_cond,
MUX_uxn_opcodes_h_l980_c32_fb67_iftrue,
MUX_uxn_opcodes_h_l980_c32_fb67_iffalse,
MUX_uxn_opcodes_h_l980_c32_fb67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144
BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_left,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_right,
BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72
result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_cond,
result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8
BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_left,
BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_right,
BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_left,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_right,
BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output,
 n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output,
 n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output,
 n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output,
 n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output,
 n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output,
 BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output,
 MUX_uxn_opcodes_h_l980_c32_fb67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output,
 BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_c482 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_ea0e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_d0da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_d4a3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_fb67_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_fb67_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_fb67_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l980_c32_fb67_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_da26 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_5e60_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l993_l958_DUPLICATE_9b6e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l980_c32_fb67_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_d0da := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l972_c3_d0da;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_d4a3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l975_c3_d4a3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l980_c32_fb67_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_c482 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l964_c3_c482;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_ea0e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l968_c3_ea0e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_da26 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l985_c3_da26;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l967_c11_965b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_left;
     BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output := BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_5e60 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_5e60_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c6_e3c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l977_c11_9d33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_left;
     BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output := BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l974_c11_ba9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l986_c24_2cd8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_left;
     BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output := BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l988_c11_e55f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_left;
     BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output := BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l980_c32_e284] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_left;
     BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output := BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l982_c11_5144] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_left;
     BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output := BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l970_c11_d51b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_left;
     BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output := BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l980_c32_e284_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l986_c24_2cd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c6_e3c8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l967_c11_965b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l970_c11_d51b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l974_c11_ba9f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l977_c11_9d33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l982_c11_5144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l988_c11_e55f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l962_l977_l974_l970_l967_DUPLICATE_32b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l988_l982_l977_l974_l970_l967_DUPLICATE_ba01_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l962_l982_l974_l970_l967_DUPLICATE_6aba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l962_l988_l977_l974_l970_l967_DUPLICATE_3b7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_5e60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l982_l977_DUPLICATE_5e60_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l962_l982_l977_l974_l970_l967_DUPLICATE_04d3_return_output;
     -- t8_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     t8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     t8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output := t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- n8_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l982_c7_ab72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l962_c1_9a32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l982_c7_ab72] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_cond;
     result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output := result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l988_c7_69ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l980_c32_c3c8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_left;
     BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output := BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l988_c7_69ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l982_c7_ab72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l980_c32_fb67_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l980_c32_c3c8_return_output;
     VAR_printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l962_c1_9a32_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l988_c7_69ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l988_c7_69ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l982_c7_ab72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- printf_uxn_opcodes_h_l963_c3_3483[uxn_opcodes_h_l963_c3_3483] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l963_c3_3483_uxn_opcodes_h_l963_c3_3483_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     t8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     t8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- n8_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l982_c7_ab72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;

     -- MUX[uxn_opcodes_h_l980_c32_fb67] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l980_c32_fb67_cond <= VAR_MUX_uxn_opcodes_h_l980_c32_fb67_cond;
     MUX_uxn_opcodes_h_l980_c32_fb67_iftrue <= VAR_MUX_uxn_opcodes_h_l980_c32_fb67_iftrue;
     MUX_uxn_opcodes_h_l980_c32_fb67_iffalse <= VAR_MUX_uxn_opcodes_h_l980_c32_fb67_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l980_c32_fb67_return_output := MUX_uxn_opcodes_h_l980_c32_fb67_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue := VAR_MUX_uxn_opcodes_h_l980_c32_fb67_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_n8_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l982_c7_ab72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- n8_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     n8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     n8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output := n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- t8_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l977_c7_5b3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l977_c7_5b3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;
     -- n8_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     n8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     n8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output := result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l974_c7_f1dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l974_c7_f1dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- n8_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l970_c7_a637] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l970_c7_a637_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l967_c7_94c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l967_c7_94c2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c2_fb9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l993_l958_DUPLICATE_9b6e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l993_l958_DUPLICATE_9b6e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c2_fb9b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l993_l958_DUPLICATE_9b6e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l993_l958_DUPLICATE_9b6e_return_output;
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
