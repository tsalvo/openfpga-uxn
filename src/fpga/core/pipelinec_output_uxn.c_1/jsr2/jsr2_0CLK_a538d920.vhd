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
entity jsr2_0CLK_a538d920 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_a538d920;
architecture arch of jsr2_0CLK_a538d920 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l681_c6_548c]
signal BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l681_c1_d1fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_pc_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l681_c2_3312]
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l681_c2_3312]
signal t16_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l682_c3_7e8d[uxn_opcodes_h_l682_c3_7e8d]
signal printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l687_c11_62f7]
signal BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l687_c7_c9d2]
signal t16_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c11_0f22]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_pc_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_c789]
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l690_c7_c789]
signal t16_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l692_c3_f7e8]
signal CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l695_c11_fec3]
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l695_c7_5ebe]
signal t16_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l698_c11_fede]
signal BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_pc_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l698_c7_9821]
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l698_c7_9821]
signal t16_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l699_c3_cf26]
signal BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l702_c32_5f7e]
signal BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l702_c32_a821]
signal BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l702_c32_1680]
signal MUX_uxn_opcodes_h_l702_c32_1680_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l702_c32_1680_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l702_c32_1680_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l702_c32_1680_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l704_c11_cede]
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_aabf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l708_c11_2a30]
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l708_c7_ecc1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_622d]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_bee5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l716_c34_555d]
signal CONST_SR_8_uxn_opcodes_h_l716_c34_555d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l718_c11_323b]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l718_c7_0298]
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_0298]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l718_c7_0298]
signal result_pc_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c7_0298]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_0298]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l723_c11_cbd2]
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_ac39]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l723_c7_ac39]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_ac39]
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_114b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.pc := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c
BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_left,
BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_right,
BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312
result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312
result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312
result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_pc_MUX_uxn_opcodes_h_l681_c2_3312
result_pc_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312
result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- t16_MUX_uxn_opcodes_h_l681_c2_3312
t16_MUX_uxn_opcodes_h_l681_c2_3312 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l681_c2_3312_cond,
t16_MUX_uxn_opcodes_h_l681_c2_3312_iftrue,
t16_MUX_uxn_opcodes_h_l681_c2_3312_iffalse,
t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

-- printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d
printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d : entity work.printf_uxn_opcodes_h_l682_c3_7e8d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7
BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_left,
BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_right,
BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2
result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2
result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2
result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2
result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2
result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2
result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2
result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- t16_MUX_uxn_opcodes_h_l687_c7_c9d2
t16_MUX_uxn_opcodes_h_l687_c7_c9d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l687_c7_c9d2_cond,
t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue,
t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse,
t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22
BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789
result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_pc_MUX_uxn_opcodes_h_l690_c7_c789
result_pc_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- t16_MUX_uxn_opcodes_h_l690_c7_c789
t16_MUX_uxn_opcodes_h_l690_c7_c789 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l690_c7_c789_cond,
t16_MUX_uxn_opcodes_h_l690_c7_c789_iftrue,
t16_MUX_uxn_opcodes_h_l690_c7_c789_iffalse,
t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output);

-- CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8
CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_x,
CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3
BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_left,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_right,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe
result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe
result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- t16_MUX_uxn_opcodes_h_l695_c7_5ebe
t16_MUX_uxn_opcodes_h_l695_c7_5ebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l695_c7_5ebe_cond,
t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue,
t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse,
t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede
BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_left,
BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_right,
BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821
result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821
result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821
result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_pc_MUX_uxn_opcodes_h_l698_c7_9821
result_pc_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- t16_MUX_uxn_opcodes_h_l698_c7_9821
t16_MUX_uxn_opcodes_h_l698_c7_9821 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l698_c7_9821_cond,
t16_MUX_uxn_opcodes_h_l698_c7_9821_iftrue,
t16_MUX_uxn_opcodes_h_l698_c7_9821_iffalse,
t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26
BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_left,
BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_right,
BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e
BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_left,
BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_right,
BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l702_c32_a821
BIN_OP_GT_uxn_opcodes_h_l702_c32_a821 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_left,
BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_right,
BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output);

-- MUX_uxn_opcodes_h_l702_c32_1680
MUX_uxn_opcodes_h_l702_c32_1680 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l702_c32_1680_cond,
MUX_uxn_opcodes_h_l702_c32_1680_iftrue,
MUX_uxn_opcodes_h_l702_c32_1680_iffalse,
MUX_uxn_opcodes_h_l702_c32_1680_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede
BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_left,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_right,
BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf
result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l704_c7_aabf
result_pc_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30
BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_left,
BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_right,
BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1
result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1
result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d
BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5
result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5
result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l714_c7_bee5
result_pc_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l716_c34_555d
CONST_SR_8_uxn_opcodes_h_l716_c34_555d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l716_c34_555d_x,
CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b
BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298
result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output);

-- result_pc_MUX_uxn_opcodes_h_l718_c7_0298
result_pc_MUX_uxn_opcodes_h_l718_c7_0298 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l718_c7_0298_cond,
result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iftrue,
result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iffalse,
result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2
BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_left,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_right,
BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output,
 CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output,
 BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output,
 BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output,
 MUX_uxn_opcodes_h_l702_c32_1680_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output,
 CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output,
 result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l684_c3_ec1c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l688_c3_1c49 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l693_c3_9c47 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l696_c3_6420 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l702_c32_1680_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l702_c32_1680_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l702_c32_1680_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l702_c32_1680_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l706_c3_af30 : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l711_c3_8bd6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l712_c24_e711_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l715_c3_5209 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l716_c34_555d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l716_c24_7f36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l699_l691_DUPLICATE_3cdb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l714_l704_l698_DUPLICATE_191f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_114b_uxn_opcodes_h_l677_l729_DUPLICATE_50d2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l702_c32_1680_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l688_c3_1c49 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l688_c3_1c49;
     VAR_MUX_uxn_opcodes_h_l702_c32_1680_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l715_c3_5209 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l715_c3_5209;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l693_c3_9c47 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l693_c3_9c47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l696_c3_6420 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l696_c3_6420;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l706_c3_af30 := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l706_c3_af30;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l684_c3_ec1c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l684_c3_ec1c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l711_c3_8bd6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l711_c3_8bd6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_right := to_unsigned(7, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l716_c34_555d_x := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l708_c11_2a30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_left;
     BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output := BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c11_323b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l698_c11_fede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_left;
     BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output := BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l687_c11_62f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l723_c11_cbd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l695_c11_fec3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_left;
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output := BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l699_l691_DUPLICATE_3cdb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l699_l691_DUPLICATE_3cdb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l714_l704_l698_DUPLICATE_191f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l714_l704_l698_DUPLICATE_191f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output := result.is_sp_shift;

     -- CONST_SR_8[uxn_opcodes_h_l716_c34_555d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l716_c34_555d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l716_c34_555d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output := CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l702_c32_5f7e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_left;
     BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output := BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_622d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l681_c6_548c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_left;
     BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output := BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l712_c24_e711] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l712_c24_e711_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c11_0f22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l704_c11_cede] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_left;
     BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output := BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_left := VAR_BIN_OP_AND_uxn_opcodes_h_l702_c32_5f7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l681_c6_548c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l687_c11_62f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_0f22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_fec3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l698_c11_fede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l704_c11_cede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_2a30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_622d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_323b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l723_c11_cbd2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l699_l691_DUPLICATE_3cdb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l699_l691_DUPLICATE_3cdb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l712_c24_e711_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l687_l690_l681_l704_l695_DUPLICATE_6a62_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l714_l704_l695_DUPLICATE_e884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l723_l714_l704_l695_DUPLICATE_35fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l687_l708_l698_l690_l681_l723_l714_l704_l695_DUPLICATE_cdfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l687_l708_l690_l681_l704_l695_DUPLICATE_3df5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l687_l718_l708_l698_l690_l681_l723_l714_l695_DUPLICATE_eb61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l690_l687_l698_l695_DUPLICATE_5f9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l687_l718_l698_l690_l681_l714_l704_l695_DUPLICATE_1ae6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l714_l704_l698_DUPLICATE_191f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l714_l704_l698_DUPLICATE_191f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l714_l704_l698_DUPLICATE_191f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l687_l698_l690_l681_l714_l704_l695_DUPLICATE_f537_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l723_c7_ac39] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l718_c7_0298] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l723_c7_ac39] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l699_c3_cf26] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_left;
     BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output := BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l718_c7_0298] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l718_c7_0298_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_cond;
     result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iftrue;
     result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output := result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l716_c24_7f36] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l716_c24_7f36_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l716_c34_555d_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l723_c7_ac39] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l681_c1_d1fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l702_c32_a821] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_left;
     BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output := BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l692_c3_f7e8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output := CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l702_c32_1680_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l702_c32_a821_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l699_c3_cf26_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l716_c24_7f36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l692_c3_f7e8_return_output;
     VAR_printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l681_c1_d1fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l723_c7_ac39_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l723_c7_ac39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l723_c7_ac39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l718_c7_0298_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l718_c7_0298_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_0298] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_0298] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- t16_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     t16_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     t16_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output := t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- MUX[uxn_opcodes_h_l702_c32_1680] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l702_c32_1680_cond <= VAR_MUX_uxn_opcodes_h_l702_c32_1680_cond;
     MUX_uxn_opcodes_h_l702_c32_1680_iftrue <= VAR_MUX_uxn_opcodes_h_l702_c32_1680_iftrue;
     MUX_uxn_opcodes_h_l702_c32_1680_iffalse <= VAR_MUX_uxn_opcodes_h_l702_c32_1680_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l702_c32_1680_return_output := MUX_uxn_opcodes_h_l702_c32_1680_return_output;

     -- printf_uxn_opcodes_h_l682_c3_7e8d[uxn_opcodes_h_l682_c3_7e8d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l682_c3_7e8d_uxn_opcodes_h_l682_c3_7e8d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l718_c7_0298] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue := VAR_MUX_uxn_opcodes_h_l702_c32_1680_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_0298_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_0298_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l718_c7_0298_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- t16_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l714_c7_bee5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l714_c7_bee5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_t16_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- t16_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     t16_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     t16_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output := t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l708_c7_ecc1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l708_c7_ecc1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l704_c7_aabf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- t16_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l704_c7_aabf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_t16_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- t16_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     t16_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     t16_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output := t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l698_c7_9821] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l698_c7_9821_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l681_c2_3312_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_5ebe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l695_c7_5ebe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l690_c7_c789] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l690_c7_c789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l687_c7_c9d2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l687_c7_c9d2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l681_c2_3312] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_114b_uxn_opcodes_h_l677_l729_DUPLICATE_50d2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_114b_uxn_opcodes_h_l677_l729_DUPLICATE_50d2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_114b(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l681_c2_3312_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l681_c2_3312_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_114b_uxn_opcodes_h_l677_l729_DUPLICATE_50d2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_114b_uxn_opcodes_h_l677_l729_DUPLICATE_50d2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
