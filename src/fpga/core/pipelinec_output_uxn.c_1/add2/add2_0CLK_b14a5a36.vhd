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
-- Submodules: 124
entity add2_0CLK_b14a5a36 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_b14a5a36;
architecture arch of add2_0CLK_b14a5a36 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l647_c6_9fb5]
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l647_c1_7012]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l647_c2_232f]
signal t16_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l647_c2_232f]
signal n16_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l647_c2_232f]
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l647_c2_232f]
signal tmp16_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l648_c3_0042[uxn_opcodes_h_l648_c3_0042]
signal printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l655_c11_35d0]
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l655_c7_2110]
signal t16_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l655_c7_2110]
signal n16_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l655_c7_2110]
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l655_c7_2110]
signal tmp16_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l659_c11_3ccb]
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal t16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal n16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l659_c7_b2d0]
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l665_c11_59e7]
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l665_c7_a173]
signal t16_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l665_c7_a173]
signal n16_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l665_c7_a173]
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l665_c7_a173]
signal tmp16_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l669_c11_2040]
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l669_c7_b55d]
signal t16_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l669_c7_b55d]
signal n16_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l669_c7_b55d]
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l669_c7_b55d]
signal tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l670_c3_ed2e]
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l674_c11_4142]
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l674_c7_33fa]
signal n16_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l674_c7_33fa]
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l674_c7_33fa]
signal tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l678_c11_b505]
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l678_c7_8341]
signal n16_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l678_c7_8341]
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l678_c7_8341]
signal tmp16_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l684_c11_64bd]
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l684_c7_120d]
signal n16_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l684_c7_120d]
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l684_c7_120d]
signal tmp16_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l688_c11_5a43]
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal n16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l688_c7_5c9c]
signal tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l689_c3_206c]
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l690_c11_a4b6]
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l693_c32_dfc3]
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l693_c32_45e9]
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l693_c32_f1d8]
signal MUX_uxn_opcodes_h_l693_c32_f1d8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_f1d8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_f1d8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l693_c32_f1d8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l695_c11_eda4]
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_22f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_22f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_22f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_22f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l695_c7_22f6]
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l701_c11_2c0b]
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_c2de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_c2de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_c2de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l701_c7_c2de]
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l704_c34_58e2]
signal CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_cbe2]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l706_c7_f70c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_f70c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;
      base.stack_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5
BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_left,
BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_right,
BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output);

-- t16_MUX_uxn_opcodes_h_l647_c2_232f
t16_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l647_c2_232f_cond,
t16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
t16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- n16_MUX_uxn_opcodes_h_l647_c2_232f
n16_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l647_c2_232f_cond,
n16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
n16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f
result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_cond,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l647_c2_232f
tmp16_MUX_uxn_opcodes_h_l647_c2_232f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l647_c2_232f_cond,
tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue,
tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse,
tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

-- printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042
printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042 : entity work.printf_uxn_opcodes_h_l648_c3_0042_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0
BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_left,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_right,
BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output);

-- t16_MUX_uxn_opcodes_h_l655_c7_2110
t16_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l655_c7_2110_cond,
t16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
t16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- n16_MUX_uxn_opcodes_h_l655_c7_2110
n16_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l655_c7_2110_cond,
n16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
n16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110
result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_cond,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- tmp16_MUX_uxn_opcodes_h_l655_c7_2110
tmp16_MUX_uxn_opcodes_h_l655_c7_2110 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l655_c7_2110_cond,
tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue,
tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse,
tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb
BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_left,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_right,
BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output);

-- t16_MUX_uxn_opcodes_h_l659_c7_b2d0
t16_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- n16_MUX_uxn_opcodes_h_l659_c7_b2d0
n16_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0
tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond,
tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue,
tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse,
tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7
BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_left,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_right,
BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output);

-- t16_MUX_uxn_opcodes_h_l665_c7_a173
t16_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l665_c7_a173_cond,
t16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
t16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- n16_MUX_uxn_opcodes_h_l665_c7_a173
n16_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l665_c7_a173_cond,
n16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
n16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173
result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_cond,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- tmp16_MUX_uxn_opcodes_h_l665_c7_a173
tmp16_MUX_uxn_opcodes_h_l665_c7_a173 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l665_c7_a173_cond,
tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue,
tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse,
tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040
BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_left,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_right,
BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output);

-- t16_MUX_uxn_opcodes_h_l669_c7_b55d
t16_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
t16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
t16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- n16_MUX_uxn_opcodes_h_l669_c7_b55d
n16_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
n16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
n16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d
result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l669_c7_b55d
tmp16_MUX_uxn_opcodes_h_l669_c7_b55d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_cond,
tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue,
tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse,
tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e
BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_left,
BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_right,
BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142
BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_left,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_right,
BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output);

-- n16_MUX_uxn_opcodes_h_l674_c7_33fa
n16_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
n16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
n16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa
result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l674_c7_33fa
tmp16_MUX_uxn_opcodes_h_l674_c7_33fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_cond,
tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505
BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_left,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_right,
BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output);

-- n16_MUX_uxn_opcodes_h_l678_c7_8341
n16_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l678_c7_8341_cond,
n16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
n16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341
result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_cond,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- tmp16_MUX_uxn_opcodes_h_l678_c7_8341
tmp16_MUX_uxn_opcodes_h_l678_c7_8341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l678_c7_8341_cond,
tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue,
tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse,
tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd
BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_left,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_right,
BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output);

-- n16_MUX_uxn_opcodes_h_l684_c7_120d
n16_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l684_c7_120d_cond,
n16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
n16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d
result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_cond,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l684_c7_120d
tmp16_MUX_uxn_opcodes_h_l684_c7_120d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l684_c7_120d_cond,
tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue,
tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse,
tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_left,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_right,
BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output);

-- n16_MUX_uxn_opcodes_h_l688_c7_5c9c
n16_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c
result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c
tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond,
tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue,
tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse,
tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l689_c3_206c
BIN_OP_OR_uxn_opcodes_h_l689_c3_206c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_left,
BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_right,
BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_left,
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_right,
BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3
BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_left,
BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_right,
BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9
BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_left,
BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_right,
BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output);

-- MUX_uxn_opcodes_h_l693_c32_f1d8
MUX_uxn_opcodes_h_l693_c32_f1d8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l693_c32_f1d8_cond,
MUX_uxn_opcodes_h_l693_c32_f1d8_iftrue,
MUX_uxn_opcodes_h_l693_c32_f1d8_iffalse,
MUX_uxn_opcodes_h_l693_c32_f1d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4
BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_left,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_right,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6
result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_left,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_right,
BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de
result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_cond,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output);

-- CONST_SR_8_uxn_opcodes_h_l704_c34_58e2
CONST_SR_8_uxn_opcodes_h_l704_c34_58e2 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_x,
CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2
BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300
CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output,
 t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output,
 t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output,
 t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output,
 t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output,
 t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output,
 n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output,
 n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output,
 n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output,
 n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output,
 MUX_uxn_opcodes_h_l693_c32_f1d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output,
 CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_ad46 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_3a2e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_a86d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_4564 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_d8b3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_1fb7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_751a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_5eab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_5c9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l690_c3_3062 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_824d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_b7dc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_981a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_19c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_3021_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_f0c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l643_l711_DUPLICATE_d074_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_right := to_unsigned(10, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_824d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_824d;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_3a2e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l657_c3_3a2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_ad46 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l651_c3_ad46;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_5eab := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l686_c3_5eab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_d8b3 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l672_c3_d8b3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_a86d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l663_c3_a86d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_981a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_981a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_1fb7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l676_c3_1fb7;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_751a := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l682_c3_751a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_4564 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l667_c3_4564;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l674_c11_4142] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_left;
     BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output := BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_232f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l647_c6_9fb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l688_c11_5a43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_left;
     BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output := BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l655_c11_35d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l695_c11_eda4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_left;
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output := BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l669_c11_2040] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_left;
     BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output := BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l659_c11_3ccb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_left;
     BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output := BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l684_c11_64bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l678_c11_b505] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_left;
     BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output := BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;

     -- result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_5c9c_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l699_c24_b7dc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_b7dc_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_f0c6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_f0c6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l701_c11_2c0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l693_c32_dfc3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_left;
     BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output := BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l665_c11_59e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_3021 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_3021_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l704_c34_58e2] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_x <= VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output := CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_cbe2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l693_c32_dfc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l647_c6_9fb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l655_c11_35d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l659_c11_3ccb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l665_c11_59e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l669_c11_2040_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l674_c11_4142_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l678_c11_b505_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l684_c11_64bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l688_c11_5a43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_eda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l701_c11_2c0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_cbe2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_3021_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_3021_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l660_l679_l689_l670_DUPLICATE_3021_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l699_c24_b7dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_19b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l669_l701_l665_l695_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_32c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l669_l665_l695_l659_l655_l684_l647_l678_l674_DUPLICATE_ab5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l669_l665_l659_l688_l655_l684_l678_l674_l706_DUPLICATE_87ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_f0c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l701_l688_DUPLICATE_f0c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l669_l701_l665_l659_l688_l655_l684_l647_l678_l674_DUPLICATE_ed77_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l647_c2_232f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_result_is_stack_read_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l688_c7_5c9c_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l670_c3_ed2e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_left;
     BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output := BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l701_c7_c2de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_22f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l704_c24_19c3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_19c3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l704_c34_58e2_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l706_c7_f70c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l647_c1_7012] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l693_c32_45e9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_left;
     BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output := BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l689_c3_206c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_left;
     BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output := BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_f70c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l693_c32_45e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l670_c3_ed2e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_right := VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l689_c3_206c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l704_c24_19c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l680_l661_DUPLICATE_3300_return_output;
     VAR_printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l647_c1_7012_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_f70c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l706_c7_f70c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;
     -- printf_uxn_opcodes_h_l648_c3_0042[uxn_opcodes_h_l648_c3_0042] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l648_c3_0042_uxn_opcodes_h_l648_c3_0042_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l690_c11_a4b6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- MUX[uxn_opcodes_h_l693_c32_f1d8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l693_c32_f1d8_cond <= VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_cond;
     MUX_uxn_opcodes_h_l693_c32_f1d8_iftrue <= VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_iftrue;
     MUX_uxn_opcodes_h_l693_c32_f1d8_iffalse <= VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_return_output := MUX_uxn_opcodes_h_l693_c32_f1d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l701_c7_c2de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l701_c7_c2de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l701_c7_c2de] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_cond;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output := result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_22f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     t16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     t16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l690_c3_3062 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l690_c11_a4b6_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_MUX_uxn_opcodes_h_l693_c32_f1d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l701_c7_c2de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_t16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue := VAR_tmp16_uxn_opcodes_h_l690_c3_3062;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_22f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_22f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;

     -- t16_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     t16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     t16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output := t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- n16_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     n16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     n16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output := n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l695_c7_22f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_n16_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_22f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output := tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- t16_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l688_c7_5c9c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output := result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     n16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     n16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output := n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l688_c7_5c9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_t16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- n16_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     n16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     n16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- t16_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     t16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     t16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output := t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l684_c7_120d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output := tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l684_c7_120d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     t16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     t16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output := t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     n16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     n16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l678_c7_8341] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_cond;
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output := result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_n16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l678_c7_8341_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l647_c2_232f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- n16_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     n16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     n16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output := n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l674_c7_33fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l674_c7_33fa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- n16_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output := tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l669_c7_b55d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_n16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l669_c7_b55d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- n16_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     n16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     n16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output := n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l665_c7_a173] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_cond;
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output := result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l665_c7_a173_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output := tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- n16_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     n16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     n16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output := n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l659_c7_b2d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l647_c2_232f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l659_c7_b2d0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output := tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l655_c7_2110] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l655_c7_2110_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l647_c2_232f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l647_c2_232f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output := result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l643_l711_DUPLICATE_d074 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l643_l711_DUPLICATE_d074_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l647_c2_232f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l647_c2_232f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l643_l711_DUPLICATE_d074_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4fbd_uxn_opcodes_h_l643_l711_DUPLICATE_d074_return_output;
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
