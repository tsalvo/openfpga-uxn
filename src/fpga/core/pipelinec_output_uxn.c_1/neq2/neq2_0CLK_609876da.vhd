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
-- BIN_OP_EQ[uxn_opcodes_h_l1294_c6_409c]
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1294_c2_5bb4]
signal t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_2675]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal n16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1307_c7_8bff]
signal t16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_a449]
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal n16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1310_c7_86b2]
signal t16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_ead1]
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1315_c7_182d]
signal n16_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_182d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_182d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_182d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1315_c7_182d]
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_182d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1315_c7_182d]
signal t16_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1316_c3_fd15]
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_df94]
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1319_c7_6f65]
signal n16_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_6f65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_6f65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_6f65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1319_c7_6f65]
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_6f65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1322_c30_d9f5]
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1324_c11_5edc]
signal BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1324_c7_3e86]
signal n16_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1324_c7_3e86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1324_c7_3e86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1324_c7_3e86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1324_c7_3e86]
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1324_c7_3e86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1325_c3_ab0e]
signal BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1329_c21_a3fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1329_c21_d79e]
signal MUX_uxn_opcodes_h_l1329_c21_d79e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1329_c21_d79e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1329_c21_d79e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1329_c21_d79e_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_left,
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_right,
BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output);

-- n16_MUX_uxn_opcodes_h_l1294_c2_5bb4
n16_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- t16_MUX_uxn_opcodes_h_l1294_c2_5bb4
t16_MUX_uxn_opcodes_h_l1294_c2_5bb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond,
t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue,
t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse,
t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_8bff
n16_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- t16_MUX_uxn_opcodes_h_l1307_c7_8bff
t16_MUX_uxn_opcodes_h_l1307_c7_8bff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond,
t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue,
t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse,
t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_left,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_right,
BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output);

-- n16_MUX_uxn_opcodes_h_l1310_c7_86b2
n16_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- t16_MUX_uxn_opcodes_h_l1310_c7_86b2
t16_MUX_uxn_opcodes_h_l1310_c7_86b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond,
t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue,
t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse,
t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_left,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_right,
BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output);

-- n16_MUX_uxn_opcodes_h_l1315_c7_182d
n16_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
n16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
n16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- t16_MUX_uxn_opcodes_h_l1315_c7_182d
t16_MUX_uxn_opcodes_h_l1315_c7_182d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1315_c7_182d_cond,
t16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue,
t16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse,
t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15
BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_left,
BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_right,
BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_left,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_right,
BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output);

-- n16_MUX_uxn_opcodes_h_l1319_c7_6f65
n16_MUX_uxn_opcodes_h_l1319_c7_6f65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1319_c7_6f65_cond,
n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue,
n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse,
n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_cond,
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5
sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_ins,
sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_x,
sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_y,
sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_left,
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_right,
BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output);

-- n16_MUX_uxn_opcodes_h_l1324_c7_3e86
n16_MUX_uxn_opcodes_h_l1324_c7_3e86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1324_c7_3e86_cond,
n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue,
n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse,
n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_cond,
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e
BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_left,
BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_right,
BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output);

-- MUX_uxn_opcodes_h_l1329_c21_d79e
MUX_uxn_opcodes_h_l1329_c21_d79e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1329_c21_d79e_cond,
MUX_uxn_opcodes_h_l1329_c21_d79e_iftrue,
MUX_uxn_opcodes_h_l1329_c21_d79e_iffalse,
MUX_uxn_opcodes_h_l1329_c21_d79e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f
CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output,
 n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output,
 n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output,
 n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output,
 n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output,
 sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output,
 n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output,
 MUX_uxn_opcodes_h_l1329_c21_d79e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1299_c3_c756 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_15a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_4d36 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_bc63 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_5aa3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_bebe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1326_c3_7702 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1320_l1311_l1325_l1316_DUPLICATE_576e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_eec9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1290_l1333_DUPLICATE_b96f_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1326_c3_7702 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1326_c3_7702;
     VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1299_c3_c756 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1299_c3_c756;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_5aa3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1317_c3_5aa3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_4d36 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1308_c3_4d36;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_bebe := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1328_c3_bebe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_15a1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1304_c3_15a1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_bc63 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1313_c3_bc63;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1324_c11_5edc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1315_c11_ead1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_2675] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1319_c11_df94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_eec9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_eec9_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1320_l1311_l1325_l1316_DUPLICATE_576e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1320_l1311_l1325_l1316_DUPLICATE_576e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1294_c6_409c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1310_c11_a449] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_left;
     BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output := BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1322_c30_d9f5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_ins;
     sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_x;
     sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output := sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1294_c6_409c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_2675_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1310_c11_a449_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1315_c11_ead1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1319_c11_df94_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1324_c11_5edc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1320_l1311_l1325_l1316_DUPLICATE_576e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1320_l1311_l1325_l1316_DUPLICATE_576e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1320_l1311_l1325_l1316_DUPLICATE_576e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1310_l1324_l1315_l1307_DUPLICATE_7180_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_591d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1324_l1319_l1315_l1310_l1307_DUPLICATE_0a47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_eec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1324_l1319_DUPLICATE_eec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1294_l1324_l1319_l1315_l1310_l1307_DUPLICATE_8c31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1294_c2_5bb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1322_c30_d9f5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1324_c7_3e86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1325_c3_ab0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_left;
     BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output := BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1324_c7_3e86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1324_c7_3e86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1316_c3_fd15] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_left;
     BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output := BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1324_c7_3e86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1316_c3_fd15_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1325_c3_ab0e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1312_l1321_DUPLICATE_7e0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1319_c7_6f65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1329_c21_a3fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     t16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     t16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1319_c7_6f65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;

     -- n16_MUX[uxn_opcodes_h_l1324_c7_3e86] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1324_c7_3e86_cond <= VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_cond;
     n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue;
     n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output := n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1319_c7_6f65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1319_c7_6f65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1329_c21_a3fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1319_c7_6f65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1319_c7_6f65_cond <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_cond;
     n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue;
     n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output := n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;

     -- MUX[uxn_opcodes_h_l1329_c21_d79e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1329_c21_d79e_cond <= VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_cond;
     MUX_uxn_opcodes_h_l1329_c21_d79e_iftrue <= VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_iftrue;
     MUX_uxn_opcodes_h_l1329_c21_d79e_iffalse <= VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_return_output := MUX_uxn_opcodes_h_l1329_c21_d79e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue := VAR_MUX_uxn_opcodes_h_l1329_c21_d79e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1324_c7_3e86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output := result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     n16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     n16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1324_c7_3e86_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1319_c7_6f65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output := result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- t16_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1319_c7_6f65_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;
     -- n16_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1315_c7_182d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1315_c7_182d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1310_c7_86b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1310_c7_86b2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_8bff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_8bff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1294_c2_5bb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1290_l1333_DUPLICATE_b96f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1290_l1333_DUPLICATE_b96f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1294_c2_5bb4_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1290_l1333_DUPLICATE_b96f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l1290_l1333_DUPLICATE_b96f_return_output;
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
