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
-- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_91cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal n16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal t16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_49a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_d856]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1938_c7_8032]
signal n16_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1938_c7_8032]
signal t16_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_8032]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_8032]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_8032]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_8032]
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_8032]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_fbc0]
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal n16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal t16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_2c43]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_36c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1946_c7_1730]
signal n16_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1946_c7_1730]
signal t16_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_1730]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_1730]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_1730]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_1730]
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_1730]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1947_c3_b3f3]
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_c4e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1950_c7_2eb8]
signal n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_2eb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_2eb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_2eb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_2eb8]
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_2eb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_bb6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_e400]
signal n16_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_e400]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_e400]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_e400]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_e400]
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_e400]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1955_c3_2e88]
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1956_c30_7aed]
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1959_c21_fbb0]
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1959_c21_1c9c]
signal MUX_uxn_opcodes_h_l1959_c21_1c9c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_1c9c_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_1c9c_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output);

-- n16_MUX_uxn_opcodes_h_l1925_c2_49a3
n16_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- t16_MUX_uxn_opcodes_h_l1925_c2_49a3
t16_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output);

-- n16_MUX_uxn_opcodes_h_l1938_c7_8032
n16_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
n16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
n16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- t16_MUX_uxn_opcodes_h_l1938_c7_8032
t16_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
t16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
t16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_left,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_right,
BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output);

-- n16_MUX_uxn_opcodes_h_l1941_c7_2c43
n16_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- t16_MUX_uxn_opcodes_h_l1941_c7_2c43
t16_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output);

-- n16_MUX_uxn_opcodes_h_l1946_c7_1730
n16_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
n16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
n16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- t16_MUX_uxn_opcodes_h_l1946_c7_1730
t16_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
t16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
t16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3
BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_left,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_right,
BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output);

-- n16_MUX_uxn_opcodes_h_l1950_c7_2eb8
n16_MUX_uxn_opcodes_h_l1950_c7_2eb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond,
n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue,
n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse,
n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_e400
n16_MUX_uxn_opcodes_h_l1954_c7_e400 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_e400_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_cond,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88
BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_left,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_right,
BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed
sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_ins,
sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_x,
sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_y,
sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0
BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_380ecc95 port map (
BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_left,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_right,
BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output);

-- MUX_uxn_opcodes_h_l1959_c21_1c9c
MUX_uxn_opcodes_h_l1959_c21_1c9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1959_c21_1c9c_cond,
MUX_uxn_opcodes_h_l1959_c21_1c9c_iftrue,
MUX_uxn_opcodes_h_l1959_c21_1c9c_iffalse,
MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745
CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output,
 n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output,
 n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output,
 n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output,
 n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output,
 n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output,
 sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output,
 MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_1568 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_5d7b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_5c34 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_125f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_1eab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_4a12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1942_l1955_l1947_DUPLICATE_d430_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_bca3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1963_l1921_DUPLICATE_30a6_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_125f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1944_c3_125f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_1eab := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_1eab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_4a12 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1958_c3_4a12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_5c34 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_5c34;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_5d7b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_5d7b;
     VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_1568 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1930_c3_1568;
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1941_c11_fbc0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_d856] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1950_c11_c4e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1956_c30_7aed] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_ins;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_x;
     sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output := sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1942_l1955_l1947_DUPLICATE_d430 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1942_l1955_l1947_DUPLICATE_d430_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1925_c6_91cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_bca3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_bca3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_bb6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_36c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1925_c6_91cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_d856_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1941_c11_fbc0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_36c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1950_c11_c4e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_bb6b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1942_l1955_l1947_DUPLICATE_d430_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1942_l1955_l1947_DUPLICATE_d430_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1951_l1942_l1955_l1947_DUPLICATE_d430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_422c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_fa3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1954_l1950_DUPLICATE_1e54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_bca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1954_l1950_DUPLICATE_bca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1946_l1941_l1938_l1925_l1954_l1950_DUPLICATE_5fee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1925_c2_49a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1956_c30_7aed_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1947_c3_b3f3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_left;
     BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output := BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_e400] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1955_c3_2e88] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_left;
     BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output := BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1954_c7_e400] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_e400] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_e400] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1947_c3_b3f3_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1955_c3_2e88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1952_l1943_DUPLICATE_9745_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1950_c7_2eb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1959_c21_fbb0] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_left;
     BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output := BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1950_c7_2eb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1954_c7_e400] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_e400_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1950_c7_2eb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     t16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     t16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1950_c7_2eb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1959_c21_fbb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     -- MUX[uxn_opcodes_h_l1959_c21_1c9c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1959_c21_1c9c_cond <= VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_cond;
     MUX_uxn_opcodes_h_l1959_c21_1c9c_iftrue <= VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_iftrue;
     MUX_uxn_opcodes_h_l1959_c21_1c9c_iffalse <= VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output := MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- n16_MUX[uxn_opcodes_h_l1950_c7_2eb8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond;
     n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue;
     n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output := n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue := VAR_MUX_uxn_opcodes_h_l1959_c21_1c9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1954_c7_e400] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output := result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- n16_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     n16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     n16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- t16_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     t16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     t16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1954_c7_e400_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- t16_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- n16_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1950_c7_2eb8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1950_c7_2eb8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     n16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     n16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1946_c7_1730] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output := result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1946_c7_1730_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1941_c7_2c43] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output := result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;

     -- n16_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1941_c7_2c43_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1938_c7_8032] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output := result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1938_c7_8032_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1925_c2_49a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1963_l1921_DUPLICATE_30a6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1963_l1921_DUPLICATE_30a6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1925_c2_49a3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1963_l1921_DUPLICATE_30a6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1963_l1921_DUPLICATE_30a6_return_output;
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
