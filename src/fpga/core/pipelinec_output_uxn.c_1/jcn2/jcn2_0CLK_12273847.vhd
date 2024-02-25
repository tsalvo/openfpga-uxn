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
-- Submodules: 50
entity jcn2_0CLK_12273847 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_12273847;
architecture arch of jcn2_0CLK_12273847 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l693_c6_db6b]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c2_cb53]
signal n8_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c2_cb53]
signal t16_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_cb53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_ed6b]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l706_c7_9f12]
signal n8_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l706_c7_9f12]
signal t16_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l706_c7_9f12]
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_9f12]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_9f12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_9f12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_9f12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l709_c11_5779]
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal n8_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal t16_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_dc4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l711_c3_c5fc]
signal CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_1315]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l714_c7_ca5c]
signal n8_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l714_c7_ca5c]
signal t16_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l714_c7_ca5c]
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_ca5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_ca5c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_ca5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l715_c3_a637]
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_4f7b]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l717_c7_22f5]
signal n8_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_22f5]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_22f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_22f5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_22f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l719_c30_6997]
signal sp_relative_shift_uxn_opcodes_h_l719_c30_6997_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_6997_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_6997_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c26_226b]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l720_c26_4c32]
signal MUX_uxn_opcodes_h_l720_c26_4c32_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_4c32_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_4c32_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_4c32_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c22_fb67]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c22_df55]
signal MUX_uxn_opcodes_h_l721_c22_df55_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_df55_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_df55_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_df55_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8098( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b
BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c2_cb53
n8_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
n8_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
n8_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c2_cb53
t16_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
t16_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
t16_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53
result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b
BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output);

-- n8_MUX_uxn_opcodes_h_l706_c7_9f12
n8_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
n8_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
n8_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- t16_MUX_uxn_opcodes_h_l706_c7_9f12
t16_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
t16_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
t16_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12
result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779
BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_left,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_right,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output);

-- n8_MUX_uxn_opcodes_h_l709_c7_dc4b
n8_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- t16_MUX_uxn_opcodes_h_l709_c7_dc4b
t16_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc
CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_x,
CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output);

-- n8_MUX_uxn_opcodes_h_l714_c7_ca5c
n8_MUX_uxn_opcodes_h_l714_c7_ca5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l714_c7_ca5c_cond,
n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue,
n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse,
n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output);

-- t16_MUX_uxn_opcodes_h_l714_c7_ca5c
t16_MUX_uxn_opcodes_h_l714_c7_ca5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l714_c7_ca5c_cond,
t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue,
t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse,
t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c
result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_cond,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l715_c3_a637
BIN_OP_OR_uxn_opcodes_h_l715_c3_a637 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_left,
BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_right,
BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b
BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output);

-- n8_MUX_uxn_opcodes_h_l717_c7_22f5
n8_MUX_uxn_opcodes_h_l717_c7_22f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l717_c7_22f5_cond,
n8_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue,
n8_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse,
n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5
result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l719_c30_6997
sp_relative_shift_uxn_opcodes_h_l719_c30_6997 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l719_c30_6997_ins,
sp_relative_shift_uxn_opcodes_h_l719_c30_6997_x,
sp_relative_shift_uxn_opcodes_h_l719_c30_6997_y,
sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b
BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output);

-- MUX_uxn_opcodes_h_l720_c26_4c32
MUX_uxn_opcodes_h_l720_c26_4c32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l720_c26_4c32_cond,
MUX_uxn_opcodes_h_l720_c26_4c32_iftrue,
MUX_uxn_opcodes_h_l720_c26_4c32_iffalse,
MUX_uxn_opcodes_h_l720_c26_4c32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67
BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output);

-- MUX_uxn_opcodes_h_l721_c22_df55
MUX_uxn_opcodes_h_l721_c22_df55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c22_df55_cond,
MUX_uxn_opcodes_h_l721_c22_df55_iftrue,
MUX_uxn_opcodes_h_l721_c22_df55_iffalse,
MUX_uxn_opcodes_h_l721_c22_df55_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output,
 n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output,
 n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output,
 n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output,
 CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output,
 n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output,
 t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output,
 n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output,
 sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output,
 MUX_uxn_opcodes_h_l720_c26_4c32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output,
 MUX_uxn_opcodes_h_l721_c22_df55_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_f011 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_b776 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_5824 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_5e53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_dc4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_4c32_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_4c32_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_4c32_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_4c32_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_df55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_df55_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_df55_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_df55_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_d267_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l725_l688_DUPLICATE_b753_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l720_c26_4c32_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_5e53 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_5e53;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_4c32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c22_df55_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_f011 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_f011;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_5824 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_5824;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_b776 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_b776;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_left := t16;
     VAR_MUX_uxn_opcodes_h_l721_c22_df55_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_ed6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c6_db6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_cb53_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_1315] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c26_226b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l709_c11_5779] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_left;
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output := BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_4f7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l719_c30_6997] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l719_c30_6997_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_ins;
     sp_relative_shift_uxn_opcodes_h_l719_c30_6997_x <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_x;
     sp_relative_shift_uxn_opcodes_h_l719_c30_6997_y <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output := sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c22_fb67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_dc4b_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_d267 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_d267_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_db6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_ed6b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_5779_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_1315_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_4f7b_return_output;
     VAR_MUX_uxn_opcodes_h_l720_c26_4c32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_226b_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c22_df55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_fb67_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_d267_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_d267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_63d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l714_l709_l706_l693_l717_DUPLICATE_71a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_7f53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_d8cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_cb53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_cb53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_dc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_6997_return_output;
     -- MUX[uxn_opcodes_h_l720_c26_4c32] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l720_c26_4c32_cond <= VAR_MUX_uxn_opcodes_h_l720_c26_4c32_cond;
     MUX_uxn_opcodes_h_l720_c26_4c32_iftrue <= VAR_MUX_uxn_opcodes_h_l720_c26_4c32_iftrue;
     MUX_uxn_opcodes_h_l720_c26_4c32_iffalse <= VAR_MUX_uxn_opcodes_h_l720_c26_4c32_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l720_c26_4c32_return_output := MUX_uxn_opcodes_h_l720_c26_4c32_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l715_c3_a637] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_left;
     BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output := BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l711_c3_c5fc] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_x <= VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output := CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- MUX[uxn_opcodes_h_l721_c22_df55] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c22_df55_cond <= VAR_MUX_uxn_opcodes_h_l721_c22_df55_cond;
     MUX_uxn_opcodes_h_l721_c22_df55_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c22_df55_iftrue;
     MUX_uxn_opcodes_h_l721_c22_df55_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c22_df55_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c22_df55_return_output := MUX_uxn_opcodes_h_l721_c22_df55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_22f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_22f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;

     -- n8_MUX[uxn_opcodes_h_l717_c7_22f5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l717_c7_22f5_cond <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_cond;
     n8_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue;
     n8_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output := n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_a637_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_c5fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue := VAR_MUX_uxn_opcodes_h_l720_c26_4c32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue := VAR_MUX_uxn_opcodes_h_l721_c22_df55_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- n8_MUX[uxn_opcodes_h_l714_c7_ca5c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l714_c7_ca5c_cond <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_cond;
     n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue;
     n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output := n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_ca5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_22f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_22f5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l714_c7_ca5c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l714_c7_ca5c_cond <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_cond;
     t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue;
     t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output := t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_ca5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_22f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- n8_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l714_c7_ca5c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output := result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;

     -- t16_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_ca5c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_n8_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_ca5c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_t16_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     -- n8_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     n8_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     n8_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- t16_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     t16_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     t16_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l709_c7_dc4b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output := result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_n8_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dc4b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_t16_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     -- t16_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     t16_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     n8_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_9f12] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_9f12_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c2_cb53] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l725_l688_DUPLICATE_b753 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l725_l688_DUPLICATE_b753_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8098(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_cb53_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_cb53_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l725_l688_DUPLICATE_b753_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l725_l688_DUPLICATE_b753_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
