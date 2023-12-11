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
-- BIN_OP_EQ[uxn_opcodes_h_l1867_c6_e15c]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1867_c2_3467]
signal t16_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1867_c2_3467]
signal n16_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1867_c2_3467]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1880_c11_e364]
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1880_c7_e1b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_e739]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1883_c7_e811]
signal t16_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1883_c7_e811]
signal n16_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_e811]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1883_c7_e811]
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c7_e811]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_e811]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_e811]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_ee29]
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1888_c7_b397]
signal t16_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1888_c7_b397]
signal n16_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1888_c7_b397]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1888_c7_b397]
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1888_c7_b397]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1888_c7_b397]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1888_c7_b397]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1889_c3_3167]
signal BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_4e48]
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1892_c7_80d5]
signal n16_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_80d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1892_c7_80d5]
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1892_c7_80d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_80d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1892_c7_80d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_0e71]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1896_c7_acc2]
signal n16_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_acc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1896_c7_acc2]
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_acc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_acc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_acc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1897_c3_cab5]
signal BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1898_c30_5c4a]
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1901_c21_e86c]
signal BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1901_c21_9ca1]
signal MUX_uxn_opcodes_h_l1901_c21_9ca1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1901_c21_9ca1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1901_c21_9ca1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output);

-- t16_MUX_uxn_opcodes_h_l1867_c2_3467
t16_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
t16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
t16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- n16_MUX_uxn_opcodes_h_l1867_c2_3467
n16_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
n16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
n16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_left,
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_right,
BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output);

-- t16_MUX_uxn_opcodes_h_l1880_c7_e1b2
t16_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- n16_MUX_uxn_opcodes_h_l1880_c7_e1b2
n16_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output);

-- t16_MUX_uxn_opcodes_h_l1883_c7_e811
t16_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
t16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
t16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- n16_MUX_uxn_opcodes_h_l1883_c7_e811
n16_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
n16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
n16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_left,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_right,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output);

-- t16_MUX_uxn_opcodes_h_l1888_c7_b397
t16_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
t16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
t16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- n16_MUX_uxn_opcodes_h_l1888_c7_b397
n16_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
n16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
n16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167
BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_left,
BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_right,
BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_left,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_right,
BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output);

-- n16_MUX_uxn_opcodes_h_l1892_c7_80d5
n16_MUX_uxn_opcodes_h_l1892_c7_80d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1892_c7_80d5_cond,
n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue,
n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse,
n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output);

-- n16_MUX_uxn_opcodes_h_l1896_c7_acc2
n16_MUX_uxn_opcodes_h_l1896_c7_acc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1896_c7_acc2_cond,
n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue,
n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse,
n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5
BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_left,
BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_right,
BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a
sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_ins,
sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_x,
sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_y,
sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c
BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_left,
BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_right,
BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output);

-- MUX_uxn_opcodes_h_l1901_c21_9ca1
MUX_uxn_opcodes_h_l1901_c21_9ca1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1901_c21_9ca1_cond,
MUX_uxn_opcodes_h_l1901_c21_9ca1_iftrue,
MUX_uxn_opcodes_h_l1901_c21_9ca1_iffalse,
MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output,
 t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output,
 t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output,
 t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output,
 t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output,
 n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output,
 n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output,
 MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1872_c3_4417 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_819f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_bd0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_abfc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_5f44 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_7bbd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_f6ea_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_l1892_DUPLICATE_7eb6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1905_l1863_DUPLICATE_b015_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_819f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_819f;
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_abfc := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_abfc;
     VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_7bbd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1900_c3_7bbd;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_bd0b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1881_c3_bd0b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_5f44 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_5f44;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1872_c3_4417 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1872_c3_4417;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := t16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_l1892_DUPLICATE_7eb6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_l1892_DUPLICATE_7eb6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_0e71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1867_c2_3467_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_f6ea LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_f6ea_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_ee29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1898_c30_5c4a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_ins;
     sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_x;
     sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output := sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1867_c2_3467_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c6_e15c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1867_c2_3467_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1880_c11_e364] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_left;
     BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output := BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_e739] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1892_c11_4e48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1867_c2_3467_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_e15c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1880_c11_e364_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_e739_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_ee29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1892_c11_4e48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_0e71_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_f6ea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_f6ea_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1884_l1893_l1889_l1897_DUPLICATE_f6ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_64bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_ca13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_DUPLICATE_2a2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_l1892_DUPLICATE_7eb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1896_l1892_DUPLICATE_7eb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1896_l1892_l1888_l1883_l1880_l1867_DUPLICATE_f8dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1867_c2_3467_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1867_c2_3467_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1867_c2_3467_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1867_c2_3467_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1898_c30_5c4a_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_acc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1897_c3_cab5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_left;
     BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output := BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1889_c3_3167] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_left;
     BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output := BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_acc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_acc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_acc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1889_c3_3167_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1897_c3_cab5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1885_l1894_DUPLICATE_7b5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1892_c7_80d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1896_c7_acc2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1896_c7_acc2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_cond;
     n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue;
     n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output := n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     t16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     t16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1892_c7_80d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1892_c7_80d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1901_c21_e86c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_left;
     BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output := BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1892_c7_80d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1901_c21_e86c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- t16_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     t16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     t16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- n16_MUX[uxn_opcodes_h_l1892_c7_80d5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1892_c7_80d5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_cond;
     n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue;
     n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output := n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;

     -- MUX[uxn_opcodes_h_l1901_c21_9ca1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1901_c21_9ca1_cond <= VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_cond;
     MUX_uxn_opcodes_h_l1901_c21_9ca1_iftrue <= VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_iftrue;
     MUX_uxn_opcodes_h_l1901_c21_9ca1_iffalse <= VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output := MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue := VAR_MUX_uxn_opcodes_h_l1901_c21_9ca1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- t16_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1896_c7_acc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     n16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     n16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1896_c7_acc2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     -- n16_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     n16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     n16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1892_c7_80d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     t16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     t16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1892_c7_80d5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1888_c7_b397] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output := result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- n16_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1888_c7_b397_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1883_c7_e811] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output := result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;

     -- n16_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     n16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     n16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1883_c7_e811_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1880_c7_e1b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1880_c7_e1b2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1867_c2_3467] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output := result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1905_l1863_DUPLICATE_b015 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1905_l1863_DUPLICATE_b015_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_3467_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1867_c2_3467_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1905_l1863_DUPLICATE_b015_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1905_l1863_DUPLICATE_b015_return_output;
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
