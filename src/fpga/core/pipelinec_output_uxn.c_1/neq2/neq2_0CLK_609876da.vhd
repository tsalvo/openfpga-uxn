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
entity neq2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_609876da;
architecture arch of neq2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1294_c6_d636]
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1294_c2_1cf2]
signal t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_f64a]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1307_c7_c6d9]
signal t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_dadb]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1310_c7_c766]
signal n16_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_c766]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_c766]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1310_c7_c766]
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_c766]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_c766]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1310_c7_c766]
signal t16_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_ba80]
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1315_c7_c327]
signal n16_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_c327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_c327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1315_c7_c327]
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_c327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_c327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1315_c7_c327]
signal t16_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1316_c3_953e]
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_00e9]
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1319_c7_c6fd]
signal n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_c6fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_c6fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1319_c7_c6fd]
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_c6fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_c6fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1322_c30_8d79]
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1324_c11_978d]
signal BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1324_c7_e74d]
signal n16_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1324_c7_e74d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1324_c7_e74d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1324_c7_e74d]
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1324_c7_e74d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1324_c7_e74d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1325_c3_f342]
signal BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1329_c21_2275]
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1329_c21_0dbd]
signal MUX_uxn_opcodes_h_l1329_c21_0dbd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1329_c21_0dbd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1329_c21_0dbd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_left,
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_right,
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output);

-- n16_MUX_uxn_opcodes_h_l1294_c2_1cf2
n16_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- t16_MUX_uxn_opcodes_h_l1294_c2_1cf2
t16_MUX_uxn_opcodes_h_l1294_c2_1cf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond,
t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue,
t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse,
t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_c6d9
n16_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- t16_MUX_uxn_opcodes_h_l1307_c7_c6d9
t16_MUX_uxn_opcodes_h_l1307_c7_c6d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond,
t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue,
t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse,
t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output);

-- n16_MUX_uxn_opcodes_h_l1310_c7_c766
n16_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
n16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
n16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- t16_MUX_uxn_opcodes_h_l1310_c7_c766
t16_MUX_uxn_opcodes_h_l1310_c7_c766 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1310_c7_c766_cond,
t16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue,
t16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse,
t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_left,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_right,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output);

-- n16_MUX_uxn_opcodes_h_l1315_c7_c327
n16_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
n16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
n16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- t16_MUX_uxn_opcodes_h_l1315_c7_c327
t16_MUX_uxn_opcodes_h_l1315_c7_c327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1315_c7_c327_cond,
t16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue,
t16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse,
t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e
BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_left,
BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_right,
BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_left,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_right,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output);

-- n16_MUX_uxn_opcodes_h_l1319_c7_c6fd
n16_MUX_uxn_opcodes_h_l1319_c7_c6fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond,
n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue,
n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse,
n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79
sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_ins,
sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_x,
sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_y,
sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_left,
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_right,
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output);

-- n16_MUX_uxn_opcodes_h_l1324_c7_e74d
n16_MUX_uxn_opcodes_h_l1324_c7_e74d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1324_c7_e74d_cond,
n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue,
n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse,
n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342
BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_left,
BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_right,
BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_left,
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_right,
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output);

-- MUX_uxn_opcodes_h_l1329_c21_0dbd
MUX_uxn_opcodes_h_l1329_c21_0dbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1329_c21_0dbd_cond,
MUX_uxn_opcodes_h_l1329_c21_0dbd_iftrue,
MUX_uxn_opcodes_h_l1329_c21_0dbd_iffalse,
MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output,
 n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output,
 n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output,
 n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output,
 n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output,
 n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output,
 MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1299_c3_704b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_d67f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_3531 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_fed0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_c4ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1326_c3_17d2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_456c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1316_l1325_l1311_l1320_DUPLICATE_6d47_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_9d0e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1290_l1333_DUPLICATE_b82a_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1326_c3_17d2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1326_c3_17d2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_d67f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_d67f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_3531 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_3531;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_fed0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_fed0;
     VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_c4ba := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_c4ba;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1299_c3_704b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1299_c3_704b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_456c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_456c;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1294_c6_d636] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_left;
     BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output := BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1316_l1325_l1311_l1320_DUPLICATE_6d47 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1316_l1325_l1311_l1320_DUPLICATE_6d47_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1324_c11_978d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_dadb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1322_c30_8d79] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_ins;
     sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_x;
     sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output := sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_9d0e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_9d0e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_ba80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_left;
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output := BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_f64a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_00e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_d636_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f64a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_dadb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ba80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_00e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_978d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1316_l1325_l1311_l1320_DUPLICATE_6d47_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1316_l1325_l1311_l1320_DUPLICATE_6d47_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1316_l1325_l1311_l1320_DUPLICATE_6d47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_208e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_a5c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_7a2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_9d0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_9d0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_l1294_DUPLICATE_d15a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1294_c2_1cf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_8d79_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1324_c7_e74d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1324_c7_e74d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1325_c3_f342] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_left;
     BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output := BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1324_c7_e74d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1316_c3_953e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_left;
     BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output := BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1324_c7_e74d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_953e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_f342_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_2b5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1324_c7_e74d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1324_c7_e74d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_cond;
     n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue;
     n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output := n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_c6fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_c6fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1329_c21_2275] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_left;
     BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output := BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output;

     -- t16_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     t16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     t16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_c6fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_c6fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_2275_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- MUX[uxn_opcodes_h_l1329_c21_0dbd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1329_c21_0dbd_cond <= VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_cond;
     MUX_uxn_opcodes_h_l1329_c21_0dbd_iftrue <= VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_iftrue;
     MUX_uxn_opcodes_h_l1329_c21_0dbd_iffalse <= VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output := MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1319_c7_c6fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond;
     n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue;
     n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output := n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     t16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     t16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue := VAR_MUX_uxn_opcodes_h_l1329_c21_0dbd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     -- t16_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- n16_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     n16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     n16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1324_c7_e74d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_e74d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1319_c7_c6fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     n16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     n16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_c6fd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1315_c7_c327] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output := result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_c327_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1310_c7_c766] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output := result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;

     -- n16_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_c766_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_c6d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_c6d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1294_c2_1cf2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1290_l1333_DUPLICATE_b82a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1290_l1333_DUPLICATE_b82a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_1cf2_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1290_l1333_DUPLICATE_b82a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1290_l1333_DUPLICATE_b82a_return_output;
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
