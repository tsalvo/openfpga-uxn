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
-- Submodules: 64
entity sta2_0CLK_4674db74 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_4674db74;
architecture arch of sta2_0CLK_4674db74 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2357_c6_7fe5]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2357_c2_6380]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2357_c2_6380]
signal n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2357_c2_6380]
signal n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2357_c2_6380]
signal t16_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2370_c11_764a]
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2370_c7_2ee4]
signal t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_8d8a]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_25be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_25be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2373_c7_25be]
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2373_c7_25be]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2373_c7_25be]
signal result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_25be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2373_c7_25be]
signal n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2373_c7_25be]
signal n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2373_c7_25be]
signal t16_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2375_c3_3562]
signal CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_b261]
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2378_c7_8b87]
signal t16_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2379_c3_275f]
signal BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2382_c11_d591]
signal BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2382_c7_8230]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2382_c7_8230]
signal result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2382_c7_8230]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2382_c7_8230]
signal result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2382_c7_8230]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2382_c7_8230]
signal n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2382_c7_8230]
signal n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2384_c30_9cf1]
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_d22e]
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_39db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2389_c7_39db]
signal result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2389_c7_39db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2389_c7_39db]
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2389_c7_39db]
signal n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2392_c22_64d5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5
BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380
result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380
result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380
result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380
result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380
result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2357_c2_6380
n16_low_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2357_c2_6380
n16_high_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- t16_MUX_uxn_opcodes_h_l2357_c2_6380
t16_MUX_uxn_opcodes_h_l2357_c2_6380 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2357_c2_6380_cond,
t16_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue,
t16_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse,
t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_left,
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_right,
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4
result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4
result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4
result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4
n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4
n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- t16_MUX_uxn_opcodes_h_l2370_c7_2ee4
t16_MUX_uxn_opcodes_h_l2370_c7_2ee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond,
t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue,
t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse,
t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be
result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be
result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2373_c7_25be
n16_low_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2373_c7_25be
n16_high_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- t16_MUX_uxn_opcodes_h_l2373_c7_25be
t16_MUX_uxn_opcodes_h_l2373_c7_25be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2373_c7_25be_cond,
t16_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue,
t16_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse,
t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2375_c3_3562
CONST_SL_8_uxn_opcodes_h_l2375_c3_3562 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_x,
CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_left,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_right,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87
n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87
n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- t16_MUX_uxn_opcodes_h_l2378_c7_8b87
t16_MUX_uxn_opcodes_h_l2378_c7_8b87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2378_c7_8b87_cond,
t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue,
t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse,
t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f
BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_left,
BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_right,
BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591
BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_left,
BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_right,
BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230
result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230
result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230
result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230
result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230
result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2382_c7_8230
n16_low_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2382_c7_8230
n16_high_MUX_uxn_opcodes_h_l2382_c7_8230 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_cond,
n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue,
n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse,
n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1
sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_ins,
sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_x,
sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_y,
sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_left,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_right,
BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db
result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond,
result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2389_c7_39db
n16_low_MUX_uxn_opcodes_h_l2389_c7_39db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_cond,
n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue,
n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse,
n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5
BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 n16_high,
 n16_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output,
 CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output,
 sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output,
 n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_8566 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2362_c3_5905 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_fc88 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_a082 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2380_c3_65f6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2378_c7_8b87_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2392_c3_d8a9 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_5cf2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2374_l2379_DUPLICATE_8d45_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l2352_l2397_DUPLICATE_1aae_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2380_c3_65f6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2380_c3_65f6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_8566 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_8566;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_fc88 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_fc88;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_5cf2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2391_c3_5cf2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2362_c3_5905 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2362_c3_5905;
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_y := to_signed(-4, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_a082 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_a082;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2378_c7_8b87_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2389_c11_d22e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c6_7fe5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2374_l2379_DUPLICATE_8d45 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2374_l2379_DUPLICATE_8d45_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l2392_c22_64d5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2384_c30_9cf1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_ins;
     sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_x;
     sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output := sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2370_c11_764a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_8d8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2357_c2_6380_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_b261] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_left;
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output := BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2357_c2_6380_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2382_c11_d591] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_left;
     BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output := BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_c2_6380_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2357_c2_6380_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c6_7fe5_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_764a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_8d8a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_b261_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2382_c11_d591_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2389_c11_d22e_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2392_c3_d8a9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2392_c22_64d5_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2374_l2379_DUPLICATE_8d45_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2374_l2379_DUPLICATE_8d45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2370_l2373_l2389_l2378_DUPLICATE_eb15_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_f80a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2370_l2389_l2382_l2378_l2373_DUPLICATE_7a2d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2370_l2382_l2373_l2378_DUPLICATE_a7a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2370_l2357_l2389_l2378_l2373_DUPLICATE_0062_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2357_c2_6380_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2357_c2_6380_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2357_c2_6380_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2357_c2_6380_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2384_c30_9cf1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2392_c3_d8a9;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2389_c7_39db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2389_c7_39db] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output := result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2389_c7_39db] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_cond;
     n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output := n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2379_c3_275f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_left;
     BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output := BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2375_c3_3562] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output := CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2389_c7_39db] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output := result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2389_c7_39db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2379_c3_275f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2375_c3_3562_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2389_c7_39db_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- t16_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2382_c7_8230] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2382_c7_8230_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     -- t16_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     t16_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     t16_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2378_c7_8b87] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_cond;
     n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output := n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2378_c7_8b87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2373_c7_25be] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output := result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2373_c7_25be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2370_c7_2ee4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     t16_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     t16_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2370_c7_2ee4_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2357_c2_6380] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_cond;
     n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output := n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2357_c2_6380_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l2352_l2397_DUPLICATE_1aae LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l2352_l2397_DUPLICATE_1aae_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2357_c2_6380_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2357_c2_6380_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l2352_l2397_DUPLICATE_1aae_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l2352_l2397_DUPLICATE_1aae_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
