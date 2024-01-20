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
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_66a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal t16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal n16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_6f70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_0ef5]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_b5a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_d007]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal t16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal n16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_17e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_2234]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_e1c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_219d]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_2a26]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_8066]
signal n16_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_8066]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_8066]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_8066]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_8066]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_8066]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_f7e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_e41c]
signal n16_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_e41c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_e41c]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_e41c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_e41c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_e41c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_8989]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_7e06]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_1151]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_ab47]
signal MUX_uxn_opcodes_h_l1878_c21_ab47_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_ab47_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_ab47_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_ab47_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_6f70
t16_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_6f70
n16_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_b5a2
t16_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_b5a2
n16_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_17e3
t16_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_17e3
n16_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_e1c2
t16_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_e1c2
n16_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d
BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_8066
n16_MUX_uxn_opcodes_h_l1869_c7_8066 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_8066_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_e41c
n16_MUX_uxn_opcodes_h_l1873_c7_e41c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_e41c_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06
sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151
BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151 : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_ab47
MUX_uxn_opcodes_h_l1878_c21_ab47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_ab47_cond,
MUX_uxn_opcodes_h_l1878_c21_ab47_iftrue,
MUX_uxn_opcodes_h_l1878_c21_ab47_iffalse,
MUX_uxn_opcodes_h_l1878_c21_ab47_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output,
 MUX_uxn_opcodes_h_l1878_c21_ab47_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_7718 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_d078 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c314 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_b0ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_22ea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_0c28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1870_l1874_DUPLICATE_252a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_d753_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1882_l1840_DUPLICATE_acf0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c314 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_c314;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_22ea := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_22ea;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_7718 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_7718;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_d078 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_d078;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_0c28 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_0c28;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_b0ce := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_b0ce;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_f7e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_2a26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_2234] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1870_l1874_DUPLICATE_252a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1870_l1874_DUPLICATE_252a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_7e06] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_66a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_0ef5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_d007] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_d753 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_d753_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_66a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_0ef5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_d007_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_2234_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_2a26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_f7e1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1870_l1874_DUPLICATE_252a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1870_l1874_DUPLICATE_252a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1866_l1870_l1874_DUPLICATE_252a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_6432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_DUPLICATE_ed76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_d753_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1873_l1869_DUPLICATE_d753_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1873_l1869_l1865_l1860_l1857_l1844_DUPLICATE_0e24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_6f70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_7e06_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_e41c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_e41c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_8989] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_219d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_e41c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_e41c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_219d_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_8989_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1871_l1862_DUPLICATE_61bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_8066] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_8066] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_e41c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_e41c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_8066] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_1151] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_8066] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_1151_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1869_c7_8066] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_8066_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;

     -- MUX[uxn_opcodes_h_l1878_c21_ab47] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_ab47_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_cond;
     MUX_uxn_opcodes_h_l1878_c21_ab47_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_ab47_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_return_output := MUX_uxn_opcodes_h_l1878_c21_ab47_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_ab47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_e41c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_e41c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_8066] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_8066_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;
     -- n16_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_e1c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_e1c2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_17e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_17e3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_b5a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_b5a2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_6f70] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1882_l1840_DUPLICATE_acf0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1882_l1840_DUPLICATE_acf0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_6f70_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1882_l1840_DUPLICATE_acf0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1882_l1840_DUPLICATE_acf0_return_output;
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
