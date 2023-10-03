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
entity eor_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor_0CLK_fd2391e7;
architecture arch of eor_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l737_c6_a4a2]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l737_c1_70db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l737_c2_97ba]
signal t8_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l737_c2_97ba]
signal n8_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l737_c2_97ba]
signal result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l738_c3_ee80[uxn_opcodes_h_l738_c3_ee80]
signal printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l743_c11_4346]
signal BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l743_c7_9088]
signal t8_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l743_c7_9088]
signal n8_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l743_c7_9088]
signal result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l746_c11_7226]
signal BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l746_c7_54b2]
signal t8_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l746_c7_54b2]
signal n8_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l746_c7_54b2]
signal result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l750_c11_0cd9]
signal BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l750_c7_5821]
signal n8_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l750_c7_5821]
signal result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l753_c11_82ef]
signal BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l753_c7_b347]
signal n8_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l753_c7_b347]
signal result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l757_c32_8bf4]
signal BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l757_c32_fd11]
signal BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l757_c32_61d5]
signal MUX_uxn_opcodes_h_l757_c32_61d5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l757_c32_61d5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l757_c32_61d5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l757_c32_61d5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l759_c11_9555]
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_bf87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_bf87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_bf87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_bf87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l759_c7_bf87]
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l763_c24_6564]
signal BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l765_c11_a7a3]
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_3ebb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_3ebb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2
BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output);

-- t8_MUX_uxn_opcodes_h_l737_c2_97ba
t8_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
t8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
t8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- n8_MUX_uxn_opcodes_h_l737_c2_97ba
n8_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
n8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
n8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba
result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba
result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba
result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba
result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

-- printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80
printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80 : entity work.printf_uxn_opcodes_h_l738_c3_ee80_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346
BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_left,
BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_right,
BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output);

-- t8_MUX_uxn_opcodes_h_l743_c7_9088
t8_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l743_c7_9088_cond,
t8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
t8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- n8_MUX_uxn_opcodes_h_l743_c7_9088
n8_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l743_c7_9088_cond,
n8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
n8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088
result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088
result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088
result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088
result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088
result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088
result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_cond,
result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_left,
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_right,
BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output);

-- t8_MUX_uxn_opcodes_h_l746_c7_54b2
t8_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
t8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
t8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- n8_MUX_uxn_opcodes_h_l746_c7_54b2
n8_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
n8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
n8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2
result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2
result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2
result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9
BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_left,
BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_right,
BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output);

-- n8_MUX_uxn_opcodes_h_l750_c7_5821
n8_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l750_c7_5821_cond,
n8_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
n8_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821
result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821
result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_cond,
result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef
BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_left,
BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_right,
BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output);

-- n8_MUX_uxn_opcodes_h_l753_c7_b347
n8_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l753_c7_b347_cond,
n8_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
n8_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347
result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347
result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_cond,
result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4
BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_left,
BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_right,
BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11
BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_left,
BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_right,
BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output);

-- MUX_uxn_opcodes_h_l757_c32_61d5
MUX_uxn_opcodes_h_l757_c32_61d5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l757_c32_61d5_cond,
MUX_uxn_opcodes_h_l757_c32_61d5_iftrue,
MUX_uxn_opcodes_h_l757_c32_61d5_iffalse,
MUX_uxn_opcodes_h_l757_c32_61d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555
BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_left,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_right,
BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87
result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_cond,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564
BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_left,
BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_right,
BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3
BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_left,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_right,
BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output);



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
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output,
 t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output,
 t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output,
 t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output,
 n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output,
 n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output,
 BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output,
 MUX_uxn_opcodes_h_l757_c32_61d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_e0da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l744_c3_d925 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l748_c3_ee61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l751_c3_51ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l757_c32_61d5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l757_c32_61d5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l757_c32_61d5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l757_c32_61d5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l762_c3_2306 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l759_DUPLICATE_e2e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l733_l770_DUPLICATE_0204_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l748_c3_ee61 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l748_c3_ee61;
     VAR_MUX_uxn_opcodes_h_l757_c32_61d5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l757_c32_61d5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l744_c3_d925 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l744_c3_d925;
     VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_e0da := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l740_c3_e0da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l751_c3_51ba := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l751_c3_51ba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l762_c3_2306 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l762_c3_2306;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_right := to_unsigned(128, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_left := VAR_ins;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l753_c11_82ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l750_c11_0cd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l746_c11_7226] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_left;
     BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output := BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l765_c11_a7a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l759_c11_9555] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_left;
     BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output := BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l759_DUPLICATE_e2e2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l759_DUPLICATE_e2e2_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c6_a4a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l763_c24_6564] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_left;
     BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output := BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l743_c11_4346] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_left;
     BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output := BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l757_c32_8bf4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_left;
     BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output := BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_left := VAR_BIN_OP_AND_uxn_opcodes_h_l757_c32_8bf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c6_a4a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c11_4346_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l746_c11_7226_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l750_c11_0cd9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l753_c11_82ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l759_c11_9555_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l765_c11_a7a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l763_c24_6564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l743_l737_l753_l750_l746_DUPLICATE_76b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l743_l765_l759_l753_l750_l746_DUPLICATE_a95d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l743_l737_l759_l750_l746_DUPLICATE_06c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l743_l753_l746_l750_DUPLICATE_1d27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l743_l737_l765_l753_l750_l746_DUPLICATE_8ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l759_DUPLICATE_e2e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l753_l759_DUPLICATE_e2e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l743_l737_l759_l753_l750_l746_DUPLICATE_38d3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l737_c1_70db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l759_c7_bf87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l765_c7_3ebb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l759_c7_bf87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output := result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l759_c7_bf87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l765_c7_3ebb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- t8_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     t8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     t8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- n8_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     n8_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     n8_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output := n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l757_c32_fd11] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_left;
     BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output := BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l757_c32_61d5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l757_c32_fd11_return_output;
     VAR_printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l737_c1_70db_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_n8_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l765_c7_3ebb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_t8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l759_c7_bf87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;

     -- t8_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     t8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     t8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output := t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l759_c7_bf87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;

     -- MUX[uxn_opcodes_h_l757_c32_61d5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l757_c32_61d5_cond <= VAR_MUX_uxn_opcodes_h_l757_c32_61d5_cond;
     MUX_uxn_opcodes_h_l757_c32_61d5_iftrue <= VAR_MUX_uxn_opcodes_h_l757_c32_61d5_iftrue;
     MUX_uxn_opcodes_h_l757_c32_61d5_iffalse <= VAR_MUX_uxn_opcodes_h_l757_c32_61d5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l757_c32_61d5_return_output := MUX_uxn_opcodes_h_l757_c32_61d5_return_output;

     -- printf_uxn_opcodes_h_l738_c3_ee80[uxn_opcodes_h_l738_c3_ee80] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l738_c3_ee80_uxn_opcodes_h_l738_c3_ee80_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- n8_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     n8_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     n8_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output := n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue := VAR_MUX_uxn_opcodes_h_l757_c32_61d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l759_c7_bf87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_t8_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- t8_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     t8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     t8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- n8_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     n8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     n8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l753_c7_b347] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_n8_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l753_c7_b347_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- n8_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     n8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     n8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output := n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l750_c7_5821] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_n8_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l750_c7_5821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- n8_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     n8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     n8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l746_c7_54b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l746_c7_54b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l743_c7_9088] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l743_c7_9088_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c2_97ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l733_l770_DUPLICATE_0204 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l733_l770_DUPLICATE_0204_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c2_97ba_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l737_c2_97ba_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l733_l770_DUPLICATE_0204_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l733_l770_DUPLICATE_0204_return_output;
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
