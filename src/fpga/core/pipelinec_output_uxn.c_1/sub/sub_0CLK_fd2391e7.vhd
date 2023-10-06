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
-- BIN_OP_EQ[uxn_opcodes_h_l2865_c6_2fe9]
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c1_181f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2865_c2_9371]
signal t8_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2865_c2_9371]
signal n8_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2865_c2_9371]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2866_c3_0ada[uxn_opcodes_h_l2866_c3_0ada]
signal printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_3997]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2871_c7_b166]
signal t8_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2871_c7_b166]
signal n8_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2871_c7_b166]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_e1bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2874_c7_9902]
signal t8_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2874_c7_9902]
signal n8_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2874_c7_9902]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_74bf]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal n8_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2878_c7_26ff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_8d0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal n8_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2881_c7_16e9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2885_c32_6369]
signal BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2885_c32_4080]
signal BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2885_c32_1afd]
signal MUX_uxn_opcodes_h_l2885_c32_1afd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2885_c32_1afd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2885_c32_1afd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2885_c32_1afd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_8a38]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2887_c7_f6b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2887_c7_f6b4]
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2887_c7_f6b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2887_c7_f6b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2887_c7_f6b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2891_c24_bf6f]
signal BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_8ce5]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2893_c7_d4da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2893_c7_d4da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9
BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_left,
BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_right,
BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output);

-- t8_MUX_uxn_opcodes_h_l2865_c2_9371
t8_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
t8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
t8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- n8_MUX_uxn_opcodes_h_l2865_c2_9371
n8_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
n8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
n8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371
result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

-- printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada
printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada : entity work.printf_uxn_opcodes_h_l2866_c3_0ada_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output);

-- t8_MUX_uxn_opcodes_h_l2871_c7_b166
t8_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
t8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
t8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- n8_MUX_uxn_opcodes_h_l2871_c7_b166
n8_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
n8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
n8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output);

-- t8_MUX_uxn_opcodes_h_l2874_c7_9902
t8_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
t8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
t8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- n8_MUX_uxn_opcodes_h_l2874_c7_9902
n8_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
n8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
n8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output);

-- n8_MUX_uxn_opcodes_h_l2878_c7_26ff
n8_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output);

-- n8_MUX_uxn_opcodes_h_l2881_c7_16e9
n8_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369
BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_left,
BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_right,
BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080
BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_left,
BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_right,
BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output);

-- MUX_uxn_opcodes_h_l2885_c32_1afd
MUX_uxn_opcodes_h_l2885_c32_1afd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2885_c32_1afd_cond,
MUX_uxn_opcodes_h_l2885_c32_1afd_iftrue,
MUX_uxn_opcodes_h_l2885_c32_1afd_iffalse,
MUX_uxn_opcodes_h_l2885_c32_1afd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4
result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f
BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_left,
BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_right,
BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da
result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da
result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output,
 t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output,
 t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output,
 t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output,
 n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output,
 n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output,
 MUX_uxn_opcodes_h_l2885_c32_1afd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_1328 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_78e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_f8fb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_cd4d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2890_c3_a89f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2887_l2881_DUPLICATE_c701_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2898_l2861_DUPLICATE_00fa_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2890_c3_a89f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2890_c3_a89f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_cd4d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2879_c3_cd4d;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_78e3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_78e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_f8fb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2876_c3_f8fb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_1328 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_1328;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2865_c6_2fe9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2887_l2881_DUPLICATE_c701 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2887_l2881_DUPLICATE_c701_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_3997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_8ce5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_e1bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2885_c32_6369] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_left;
     BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output := BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output := result.is_stack_write;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2891_c24_bf6f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_8d0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_74bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_8a38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2885_c32_6369_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c6_2fe9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_3997_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e1bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_74bf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_8d0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_8a38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_8ce5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2891_c24_bf6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2865_l2881_l2878_l2874_l2871_DUPLICATE_66ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2893_l2887_l2881_l2878_l2874_l2871_DUPLICATE_9d13_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2865_l2887_l2878_l2874_l2871_DUPLICATE_e76e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2874_l2878_l2871_l2881_DUPLICATE_342c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2865_l2893_l2881_l2878_l2874_l2871_DUPLICATE_d5b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2887_l2881_DUPLICATE_c701_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2887_l2881_DUPLICATE_c701_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2865_l2887_l2881_l2878_l2874_l2871_DUPLICATE_d9fc_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2885_c32_4080] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_left;
     BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output := BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2887_c7_f6b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2887_c7_f6b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2893_c7_d4da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2887_c7_f6b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     t8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     t8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2893_c7_d4da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c1_181f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2885_c32_4080_return_output;
     VAR_printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_181f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2893_c7_d4da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     -- n8_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2887_c7_f6b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     t8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     t8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- printf_uxn_opcodes_h_l2866_c3_0ada[uxn_opcodes_h_l2866_c3_0ada] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2866_c3_0ada_uxn_opcodes_h_l2866_c3_0ada_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2887_c7_f6b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- MUX[uxn_opcodes_h_l2885_c32_1afd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2885_c32_1afd_cond <= VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_cond;
     MUX_uxn_opcodes_h_l2885_c32_1afd_iftrue <= VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_iftrue;
     MUX_uxn_opcodes_h_l2885_c32_1afd_iffalse <= VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_return_output := MUX_uxn_opcodes_h_l2885_c32_1afd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue := VAR_MUX_uxn_opcodes_h_l2885_c32_1afd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2887_c7_f6b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     -- n8_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     n8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     n8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- t8_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     t8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     t8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2881_c7_16e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2881_c7_16e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- n8_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     n8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     n8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2878_c7_26ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2878_c7_26ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2874_c7_9902] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- n8_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     n8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     n8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2874_c7_9902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2871_c7_b166] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2871_c7_b166_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2865_c2_9371] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2898_l2861_DUPLICATE_00fa LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2898_l2861_DUPLICATE_00fa_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2865_c2_9371_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2865_c2_9371_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2898_l2861_DUPLICATE_00fa_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2898_l2861_DUPLICATE_00fa_return_output;
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
