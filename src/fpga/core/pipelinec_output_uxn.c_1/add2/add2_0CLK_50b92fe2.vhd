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
-- Submodules: 71
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l854_c6_938c]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l854_c2_11cd]
signal tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l854_c2_11cd]
signal n16_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l854_c2_11cd]
signal t16_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_11cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l867_c11_dd0d]
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l867_c7_33fc]
signal tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l867_c7_33fc]
signal n16_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l867_c7_33fc]
signal t16_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l867_c7_33fc]
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_33fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_33fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_33fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_33fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l870_c11_21c4]
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l870_c7_d362]
signal tmp16_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l870_c7_d362]
signal n16_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l870_c7_d362]
signal t16_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l870_c7_d362]
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_d362]
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_d362]
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_d362]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_d362]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l875_c11_0444]
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l875_c7_70d8]
signal tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l875_c7_70d8]
signal n16_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l875_c7_70d8]
signal t16_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l875_c7_70d8]
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_70d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_70d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_70d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_70d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l876_c3_24e1]
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l879_c11_f380]
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l879_c7_6b70]
signal tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l879_c7_6b70]
signal n16_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l879_c7_6b70]
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_6b70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_6b70]
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_6b70]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_6b70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l883_c11_353d]
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l883_c7_8a96]
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l883_c7_8a96]
signal n16_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l883_c7_8a96]
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_8a96]
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_8a96]
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_8a96]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_8a96]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l884_c3_8a85]
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_706c]
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l886_c30_078b]
signal sp_relative_shift_uxn_opcodes_h_l886_c30_078b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_078b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_078b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l891_c11_7e1c]
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_369d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l891_c7_369d]
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_369d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_369d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l894_c31_ea60]
signal CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c
BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l854_c2_11cd
tmp16_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- n16_MUX_uxn_opcodes_h_l854_c2_11cd
n16_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
n16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
n16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- t16_MUX_uxn_opcodes_h_l854_c2_11cd
t16_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
t16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
t16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd
result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d
BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_left,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_right,
BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l867_c7_33fc
tmp16_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- n16_MUX_uxn_opcodes_h_l867_c7_33fc
n16_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
n16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
n16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- t16_MUX_uxn_opcodes_h_l867_c7_33fc
t16_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
t16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
t16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc
result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4
BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_left,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_right,
BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l870_c7_d362
tmp16_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l870_c7_d362_cond,
tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- n16_MUX_uxn_opcodes_h_l870_c7_d362
n16_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l870_c7_d362_cond,
n16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
n16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- t16_MUX_uxn_opcodes_h_l870_c7_d362
t16_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l870_c7_d362_cond,
t16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
t16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362
result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_cond,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444
BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_left,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_right,
BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output);

-- tmp16_MUX_uxn_opcodes_h_l875_c7_70d8
tmp16_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- n16_MUX_uxn_opcodes_h_l875_c7_70d8
n16_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
n16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
n16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- t16_MUX_uxn_opcodes_h_l875_c7_70d8
t16_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
t16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
t16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8
result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1
BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_left,
BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_right,
BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_left,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_right,
BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output);

-- tmp16_MUX_uxn_opcodes_h_l879_c7_6b70
tmp16_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- n16_MUX_uxn_opcodes_h_l879_c7_6b70
n16_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
n16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
n16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70
result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d
BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_left,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_right,
BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l883_c7_8a96
tmp16_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- n16_MUX_uxn_opcodes_h_l883_c7_8a96
n16_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
n16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
n16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85
BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_left,
BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_right,
BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_left,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_right,
BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l886_c30_078b
sp_relative_shift_uxn_opcodes_h_l886_c30_078b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l886_c30_078b_ins,
sp_relative_shift_uxn_opcodes_h_l886_c30_078b_x,
sp_relative_shift_uxn_opcodes_h_l886_c30_078b_y,
sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_left,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_right,
BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d
result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_cond,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l894_c31_ea60
CONST_SR_8_uxn_opcodes_h_l894_c31_ea60 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_x,
CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0
CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output,
 tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output,
 tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output,
 tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output,
 tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output,
 tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output,
 tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output,
 BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output,
 sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output,
 CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_5c0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_ce48 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_0973 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_6a97 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_d303 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l885_c3_6613 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_32fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_96da_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_371e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_96bf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_1fdc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l884_l871_l876_DUPLICATE_78fd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_e98e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l898_l850_DUPLICATE_4802_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_371e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_371e;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_ce48 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l859_c3_ce48;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_5c0b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l864_c3_5c0b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_0973 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l868_c3_0973;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_32fa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l888_c3_32fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_96bf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l892_c3_96bf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_d303 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l877_c3_d303;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_6a97 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l873_c3_6a97;
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_y := resize(to_signed(-2, 3), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_11cd_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l875_c11_0444] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_left;
     BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output := BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l854_c6_938c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l870_c11_21c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l879_c11_f380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_left;
     BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output := BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_11cd_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l867_c11_dd0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l891_c11_7e1c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_left;
     BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output := BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_11cd_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l894_c31_ea60] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_x <= VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output := CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l886_c30_078b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l886_c30_078b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_ins;
     sp_relative_shift_uxn_opcodes_h_l886_c30_078b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_x;
     sp_relative_shift_uxn_opcodes_h_l886_c30_078b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output := sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_e98e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_e98e_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_11cd_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l883_c11_353d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_left;
     BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output := BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l884_l871_l876_DUPLICATE_78fd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l884_l871_l876_DUPLICATE_78fd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c6_938c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l867_c11_dd0d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l870_c11_21c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l875_c11_0444_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l879_c11_f380_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l883_c11_353d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l891_c11_7e1c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l884_l871_l876_DUPLICATE_78fd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l884_l871_l876_DUPLICATE_78fd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l880_l884_l871_l876_DUPLICATE_78fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l879_l875_l870_l867_l891_DUPLICATE_039d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_l891_DUPLICATE_87a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l883_l879_l875_l870_l867_DUPLICATE_df92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_e98e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l891_l879_DUPLICATE_e98e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l879_l875_l870_l867_l854_l891_DUPLICATE_f2a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l854_c2_11cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l854_c2_11cd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l854_c2_11cd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l854_c2_11cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l886_c30_078b_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l891_c7_369d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l891_c7_369d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l891_c7_369d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l884_c3_8a85] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_left;
     BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output := BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l894_c21_1fdc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_1fdc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l894_c31_ea60_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l876_c3_24e1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_left;
     BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output := BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l876_c3_24e1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_right := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l884_c3_8a85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l894_c21_1fdc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l872_l881_DUPLICATE_8cb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l891_c7_369d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l891_c7_369d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l891_c7_369d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l891_c7_369d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output := result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- n16_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     n16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     n16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l885_c11_706c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- t16_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     t16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     t16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l885_c3_6613 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l885_c11_706c_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_n16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l891_c7_369d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_t16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := VAR_tmp16_uxn_opcodes_h_l885_c3_6613;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- n16_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     n16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     n16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- t16_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     t16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     t16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output := t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l889_c21_96da] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_96da_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l885_c3_6613);

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l889_c21_96da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l883_c7_8a96] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_cond;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output := result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- t16_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     t16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     t16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     n16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     n16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_n16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l883_c7_8a96_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- t16_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     t16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     t16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- n16_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     n16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     n16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output := n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l879_c7_6b70] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_cond;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output := result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l879_c7_6b70_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- n16_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     n16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     n16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l875_c7_70d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output := tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l875_c7_70d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l870_c7_d362] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_cond;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output := result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output;

     -- n16_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     n16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     n16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l870_c7_d362_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l867_c7_33fc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output := result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l867_c7_33fc_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l854_c2_11cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l898_l850_DUPLICATE_4802 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l898_l850_DUPLICATE_4802_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l854_c2_11cd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c2_11cd_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l898_l850_DUPLICATE_4802_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l898_l850_DUPLICATE_4802_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
