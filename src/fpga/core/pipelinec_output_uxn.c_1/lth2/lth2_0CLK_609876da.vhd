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
-- Submodules: 58
entity lth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_609876da;
architecture arch of lth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1941_c6_e5eb]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1941_c2_a992]
signal n16_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1941_c2_a992]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1941_c2_a992]
signal t16_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_1e8b]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal n16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1954_c7_4c81]
signal t16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_1f14]
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal n16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1957_c7_c70a]
signal t16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_b596]
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1962_c7_c095]
signal n16_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_c095]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_c095]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_c095]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1962_c7_c095]
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_c095]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1962_c7_c095]
signal t16_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1963_c3_47dd]
signal BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_1e8d]
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1966_c7_9f9a]
signal n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_9f9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_9f9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_9f9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1966_c7_9f9a]
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_9f9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_943f]
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1970_c7_4762]
signal n16_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_4762]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_4762]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_4762]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1970_c7_4762]
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_4762]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1971_c3_e2af]
signal BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1972_c30_4880]
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1975_c21_d464]
signal BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1975_c21_e4d9]
signal MUX_uxn_opcodes_h_l1975_c21_e4d9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1975_c21_e4d9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1975_c21_e4d9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output);

-- n16_MUX_uxn_opcodes_h_l1941_c2_a992
n16_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
n16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
n16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- t16_MUX_uxn_opcodes_h_l1941_c2_a992
t16_MUX_uxn_opcodes_h_l1941_c2_a992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1941_c2_a992_cond,
t16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue,
t16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse,
t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_4c81
n16_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- t16_MUX_uxn_opcodes_h_l1954_c7_4c81
t16_MUX_uxn_opcodes_h_l1954_c7_4c81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond,
t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue,
t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse,
t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_left,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_right,
BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output);

-- n16_MUX_uxn_opcodes_h_l1957_c7_c70a
n16_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- t16_MUX_uxn_opcodes_h_l1957_c7_c70a
t16_MUX_uxn_opcodes_h_l1957_c7_c70a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond,
t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue,
t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse,
t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_left,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_right,
BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output);

-- n16_MUX_uxn_opcodes_h_l1962_c7_c095
n16_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
n16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
n16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- t16_MUX_uxn_opcodes_h_l1962_c7_c095
t16_MUX_uxn_opcodes_h_l1962_c7_c095 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1962_c7_c095_cond,
t16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue,
t16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse,
t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd
BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_left,
BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_right,
BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_left,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_right,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output);

-- n16_MUX_uxn_opcodes_h_l1966_c7_9f9a
n16_MUX_uxn_opcodes_h_l1966_c7_9f9a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond,
n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue,
n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse,
n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_left,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_right,
BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output);

-- n16_MUX_uxn_opcodes_h_l1970_c7_4762
n16_MUX_uxn_opcodes_h_l1970_c7_4762 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1970_c7_4762_cond,
n16_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue,
n16_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse,
n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_cond,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af
BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_left,
BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_right,
BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1972_c30_4880
sp_relative_shift_uxn_opcodes_h_l1972_c30_4880 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_ins,
sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_x,
sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_y,
sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464
BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_left,
BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_right,
BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output);

-- MUX_uxn_opcodes_h_l1975_c21_e4d9
MUX_uxn_opcodes_h_l1975_c21_e4d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1975_c21_e4d9_cond,
MUX_uxn_opcodes_h_l1975_c21_e4d9_iftrue,
MUX_uxn_opcodes_h_l1975_c21_e4d9_iffalse,
MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output,
 n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output,
 n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output,
 n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output,
 n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output,
 n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output,
 sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output,
 MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1946_c3_08a5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1951_c3_4cbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1955_c3_8748 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_ff10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_f9ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_3ea9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1971_l1963_l1967_DUPLICATE_37a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_0b00_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1979_l1937_DUPLICATE_9b04_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_ff10 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1960_c3_ff10;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1951_c3_4cbb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1951_c3_4cbb;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1946_c3_08a5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1946_c3_08a5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_f9ab := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_f9ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_3ea9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1974_c3_3ea9;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1955_c3_8748 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1955_c3_8748;
     VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1972_c30_4880] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_ins;
     sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_x;
     sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output := sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1970_c11_943f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1941_c2_a992_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1957_c11_1f14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1971_l1963_l1967_DUPLICATE_37a5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1971_l1963_l1967_DUPLICATE_37a5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_1e8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c6_e5eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1962_c11_b596] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_left;
     BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output := BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_0b00 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_0b00_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1941_c2_a992_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_1e8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1941_c2_a992_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1941_c2_a992_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c6_e5eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_1e8b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1957_c11_1f14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1962_c11_b596_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_1e8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1970_c11_943f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1971_l1963_l1967_DUPLICATE_37a5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1971_l1963_l1967_DUPLICATE_37a5_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1958_l1971_l1963_l1967_DUPLICATE_37a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_e12d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_58d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1957_l1954_l1970_l1966_l1962_DUPLICATE_253c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_0b00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_l1970_DUPLICATE_0b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1957_l1954_l1941_l1970_l1966_l1962_DUPLICATE_714c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1941_c2_a992_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1941_c2_a992_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1941_c2_a992_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1941_c2_a992_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1972_c30_4880_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1970_c7_4762] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1970_c7_4762] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1970_c7_4762] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1970_c7_4762] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1963_c3_47dd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_left;
     BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output := BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1971_c3_e2af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_left;
     BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output := BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1963_c3_47dd_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1971_c3_e2af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1968_l1959_DUPLICATE_b7d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_9f9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1970_c7_4762] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1970_c7_4762_cond <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_cond;
     n16_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue;
     n16_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output := n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1966_c7_9f9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_9f9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1975_c21_d464] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_left;
     BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output := BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output;

     -- t16_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     t16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     t16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_9f9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1975_c21_d464_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     -- n16_MUX[uxn_opcodes_h_l1966_c7_9f9a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond;
     n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue;
     n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output := n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- t16_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- MUX[uxn_opcodes_h_l1975_c21_e4d9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1975_c21_e4d9_cond <= VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_cond;
     MUX_uxn_opcodes_h_l1975_c21_e4d9_iftrue <= VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_iftrue;
     MUX_uxn_opcodes_h_l1975_c21_e4d9_iffalse <= VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output := MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue := VAR_MUX_uxn_opcodes_h_l1975_c21_e4d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     n16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     n16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1970_c7_4762] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output := result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;

     -- t16_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1970_c7_4762_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- n16_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     t16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     t16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1966_c7_9f9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1966_c7_9f9a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1962_c7_c095] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output := result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1962_c7_c095_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1957_c7_c70a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     n16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     n16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1957_c7_c70a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_4c81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output := result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_4c81_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1941_c2_a992] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output := result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1979_l1937_DUPLICATE_9b04 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1979_l1937_DUPLICATE_9b04_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c2_a992_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1941_c2_a992_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1979_l1937_DUPLICATE_9b04_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1979_l1937_DUPLICATE_9b04_return_output;
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
