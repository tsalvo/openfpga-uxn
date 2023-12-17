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
-- BIN_OP_EQ[uxn_opcodes_h_l1300_c6_7def]
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1300_c2_cbc5]
signal n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_5c18]
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal t16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1313_c7_fb66]
signal n16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1316_c11_20af]
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal t16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1316_c7_5aab]
signal n16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1321_c11_581a]
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1321_c7_0b1d]
signal n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1322_c3_4220]
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_5e7f]
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_c0c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_c0c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_c0c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_c0c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1325_c7_c0c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1325_c7_c0c3]
signal n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1328_c30_0aa0]
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1330_c11_f318]
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c7_475a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c7_475a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c7_475a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c7_475a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1330_c7_475a]
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1330_c7_475a]
signal n16_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1331_c3_a69b]
signal BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1335_c21_ec16]
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1335_c21_6050]
signal MUX_uxn_opcodes_h_l1335_c21_6050_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1335_c21_6050_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1335_c21_6050_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1335_c21_6050_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e848( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_left,
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_right,
BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- t16_MUX_uxn_opcodes_h_l1300_c2_cbc5
t16_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- n16_MUX_uxn_opcodes_h_l1300_c2_cbc5
n16_MUX_uxn_opcodes_h_l1300_c2_cbc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond,
n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue,
n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse,
n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_left,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_right,
BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- t16_MUX_uxn_opcodes_h_l1313_c7_fb66
t16_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- n16_MUX_uxn_opcodes_h_l1313_c7_fb66
n16_MUX_uxn_opcodes_h_l1313_c7_fb66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond,
n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue,
n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse,
n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_left,
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_right,
BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- t16_MUX_uxn_opcodes_h_l1316_c7_5aab
t16_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- n16_MUX_uxn_opcodes_h_l1316_c7_5aab
n16_MUX_uxn_opcodes_h_l1316_c7_5aab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond,
n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue,
n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse,
n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_left,
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_right,
BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- t16_MUX_uxn_opcodes_h_l1321_c7_0b1d
t16_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- n16_MUX_uxn_opcodes_h_l1321_c7_0b1d
n16_MUX_uxn_opcodes_h_l1321_c7_0b1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond,
n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue,
n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse,
n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220
BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_left,
BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_right,
BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_left,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_right,
BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output);

-- n16_MUX_uxn_opcodes_h_l1325_c7_c0c3
n16_MUX_uxn_opcodes_h_l1325_c7_c0c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond,
n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue,
n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse,
n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0
sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_ins,
sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_x,
sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_y,
sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_left,
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_right,
BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output);

-- n16_MUX_uxn_opcodes_h_l1330_c7_475a
n16_MUX_uxn_opcodes_h_l1330_c7_475a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1330_c7_475a_cond,
n16_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue,
n16_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse,
n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b
BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_left,
BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_right,
BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_left,
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_right,
BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output);

-- MUX_uxn_opcodes_h_l1335_c21_6050
MUX_uxn_opcodes_h_l1335_c21_6050 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1335_c21_6050_cond,
MUX_uxn_opcodes_h_l1335_c21_6050_iftrue,
MUX_uxn_opcodes_h_l1335_c21_6050_iffalse,
MUX_uxn_opcodes_h_l1335_c21_6050_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e
CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output,
 n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output,
 n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output,
 MUX_uxn_opcodes_h_l1335_c21_6050_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1305_c3_bd17 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_5db8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_fced : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1319_c3_807a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_aef7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_43d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1332_c3_1be8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_6050_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_6050_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_6050_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1335_c21_6050_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1317_l1322_l1331_l1326_DUPLICATE_22e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1330_DUPLICATE_9aa9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1339_l1296_DUPLICATE_ee03_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1332_c3_1be8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1332_c3_1be8;
     VAR_MUX_uxn_opcodes_h_l1335_c21_6050_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_5db8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1310_c3_5db8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_fced := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1314_c3_fced;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_y := resize(to_signed(-3, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1305_c3_bd17 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1305_c3_bd17;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1335_c21_6050_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1319_c3_807a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1319_c3_807a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_aef7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1323_c3_aef7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_43d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1334_c3_43d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1316_c11_20af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1313_c11_5c18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_left;
     BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output := BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1330_c11_f318] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_left;
     BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output := BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1328_c30_0aa0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_ins;
     sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_x;
     sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output := sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1325_c11_5e7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1300_c6_7def] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_left;
     BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output := BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1330_DUPLICATE_9aa9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1330_DUPLICATE_9aa9_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1317_l1322_l1331_l1326_DUPLICATE_22e4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1317_l1322_l1331_l1326_DUPLICATE_22e4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1321_c11_581a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1300_c6_7def_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1313_c11_5c18_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1316_c11_20af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1321_c11_581a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1325_c11_5e7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1330_c11_f318_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1317_l1322_l1331_l1326_DUPLICATE_22e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1317_l1322_l1331_l1326_DUPLICATE_22e4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1317_l1322_l1331_l1326_DUPLICATE_22e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1316_l1330_l1321_l1313_DUPLICATE_19ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1330_DUPLICATE_8b9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1330_DUPLICATE_9aa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1325_l1330_DUPLICATE_9aa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1325_l1321_l1316_l1313_l1300_l1330_DUPLICATE_0beb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1300_c2_cbc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1328_c30_0aa0_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1322_c3_4220] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_left;
     BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output := BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1330_c7_475a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1330_c7_475a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1330_c7_475a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1331_c3_a69b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_left;
     BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output := BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1330_c7_475a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1322_c3_4220_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1331_c3_a69b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1318_l1327_DUPLICATE_6b5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1325_c7_c0c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1335_c21_ec16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_left;
     BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output := BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1325_c7_c0c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1325_c7_c0c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1325_c7_c0c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1330_c7_475a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1330_c7_475a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_cond;
     n16_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue;
     n16_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output := n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1335_c21_6050_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1335_c21_ec16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     -- MUX[uxn_opcodes_h_l1335_c21_6050] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1335_c21_6050_cond <= VAR_MUX_uxn_opcodes_h_l1335_c21_6050_cond;
     MUX_uxn_opcodes_h_l1335_c21_6050_iftrue <= VAR_MUX_uxn_opcodes_h_l1335_c21_6050_iftrue;
     MUX_uxn_opcodes_h_l1335_c21_6050_iffalse <= VAR_MUX_uxn_opcodes_h_l1335_c21_6050_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1335_c21_6050_return_output := MUX_uxn_opcodes_h_l1335_c21_6050_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1325_c7_c0c3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond;
     n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue;
     n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output := n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue := VAR_MUX_uxn_opcodes_h_l1335_c21_6050_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     -- t16_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1330_c7_475a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- n16_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1330_c7_475a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- t16_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1325_c7_c0c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1325_c7_c0c3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1321_c7_0b1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1321_c7_0b1d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1316_c7_5aab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1316_c7_5aab_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1313_c7_fb66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output := result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1313_c7_fb66_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1300_c2_cbc5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1339_l1296_DUPLICATE_ee03 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1339_l1296_DUPLICATE_ee03_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1300_c2_cbc5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1339_l1296_DUPLICATE_ee03_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l1339_l1296_DUPLICATE_ee03_return_output;
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
