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
entity lth2_0CLK_977cbcae is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_977cbcae;
architecture arch of lth2_0CLK_977cbcae is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_385b]
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal t16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal n16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_5c55]
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_7de9]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal t16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal n16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_64bb]
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_1858]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_6e3a]
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_23c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1946_c7_e719]
signal t16_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1946_c7_e719]
signal n16_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_e719]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_e719]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_e719]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_e719]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_e719]
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1947_c3_0eff]
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_3fb7]
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1950_c7_96f7]
signal n16_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_96f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_96f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_96f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_96f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_96f7]
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_f1ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_2f43]
signal n16_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_2f43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_2f43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_2f43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_2f43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_2f43]
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1955_c3_ea63]
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1956_c30_a27b]
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1959_c21_6533]
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1959_c21_7f94]
signal MUX_uxn_opcodes_h_l1959_c21_7f94_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_7f94_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_7f94_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_7f94_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_04b4( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_left,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_right,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output);

-- t16_MUX_uxn_opcodes_h_l1925_c2_5c55
t16_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- n16_MUX_uxn_opcodes_h_l1925_c2_5c55
n16_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output);

-- t16_MUX_uxn_opcodes_h_l1938_c7_64bb
t16_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- n16_MUX_uxn_opcodes_h_l1938_c7_64bb
n16_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output);

-- t16_MUX_uxn_opcodes_h_l1941_c7_6e3a
t16_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- n16_MUX_uxn_opcodes_h_l1941_c7_6e3a
n16_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output);

-- t16_MUX_uxn_opcodes_h_l1946_c7_e719
t16_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
t16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
t16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- n16_MUX_uxn_opcodes_h_l1946_c7_e719
n16_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
n16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
n16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_cond,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff
BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_left,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_right,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_left,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_right,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output);

-- n16_MUX_uxn_opcodes_h_l1950_c7_96f7
n16_MUX_uxn_opcodes_h_l1950_c7_96f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1950_c7_96f7_cond,
n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue,
n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse,
n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_2f43
n16_MUX_uxn_opcodes_h_l1954_c7_2f43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_2f43_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_cond,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63
BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_left,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_right,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b
sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_ins,
sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_x,
sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_y,
sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533
BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_left,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_right,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output);

-- MUX_uxn_opcodes_h_l1959_c21_7f94
MUX_uxn_opcodes_h_l1959_c21_7f94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1959_c21_7f94_cond,
MUX_uxn_opcodes_h_l1959_c21_7f94_iftrue,
MUX_uxn_opcodes_h_l1959_c21_7f94_iffalse,
MUX_uxn_opcodes_h_l1959_c21_7f94_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11
CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output,
 t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output,
 t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output,
 t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output,
 t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output,
 n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output,
 sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output,
 MUX_uxn_opcodes_h_l1959_c21_7f94_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_2f23 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_7f01 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_2f15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_cd6a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_2bcd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_5146 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1942_l1951_l1955_l1947_DUPLICATE_2037_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_5cef_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1963_l1921_DUPLICATE_f725_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_2f23 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_2f23;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_2bcd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_2bcd;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_7f01 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_7f01;
     VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_cd6a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_cd6a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_5146 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_5146;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_2f15 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_2f15;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_y := resize(to_signed(-3, 3), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_1858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_f1ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_385b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_7de9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_5cef LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_5cef_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1956_c30_a27b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_ins;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_x;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output := sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_23c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1942_l1951_l1955_l1947_DUPLICATE_2037 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1942_l1951_l1955_l1947_DUPLICATE_2037_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_3fb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_385b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_7de9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_1858_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_23c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_3fb7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f1ff_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1942_l1951_l1955_l1947_DUPLICATE_2037_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1942_l1951_l1955_l1947_DUPLICATE_2037_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1942_l1951_l1955_l1947_DUPLICATE_2037_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_253b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_8f44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_DUPLICATE_9661_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_5cef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_5cef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1954_l1950_l1946_l1941_l1938_l1925_DUPLICATE_6690_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_5c55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_a27b_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1947_c3_0eff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_left;
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output := BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_2f43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_2f43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_2f43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1955_c3_ea63] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_left;
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output := BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_2f43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_0eff_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_ea63_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1943_l1952_DUPLICATE_ae11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_96f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1959_c21_6533] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_left;
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output := BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_96f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     t16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     t16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_96f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c7_2f43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_2f43_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_96f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_6533_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     -- n16_MUX[uxn_opcodes_h_l1950_c7_96f7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1950_c7_96f7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_cond;
     n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue;
     n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output := n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- MUX[uxn_opcodes_h_l1959_c21_7f94] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1959_c21_7f94_cond <= VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_cond;
     MUX_uxn_opcodes_h_l1959_c21_7f94_iftrue <= VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_iftrue;
     MUX_uxn_opcodes_h_l1959_c21_7f94_iffalse <= VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_return_output := MUX_uxn_opcodes_h_l1959_c21_7f94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- t16_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue := VAR_MUX_uxn_opcodes_h_l1959_c21_7f94_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     n16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     n16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- t16_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_2f43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output := result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_2f43_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_96f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_96f7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_e719] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output := result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;

     -- n16_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_e719_return_output;
     -- n16_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_6e3a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_6e3a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_64bb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_64bb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_5c55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1963_l1921_DUPLICATE_f725 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1963_l1921_DUPLICATE_f725_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_04b4(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_5c55_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1963_l1921_DUPLICATE_f725_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_04b4_uxn_opcodes_h_l1963_l1921_DUPLICATE_f725_return_output;
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
