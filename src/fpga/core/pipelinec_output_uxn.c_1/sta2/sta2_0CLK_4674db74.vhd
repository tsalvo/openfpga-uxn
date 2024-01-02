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
-- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_a6e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal t16_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2339_c2_72ff]
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_7509]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal t16_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2352_c7_6e82]
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_a1ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal t16_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2355_c7_dee6]
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2357_c3_61c4]
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_7369]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal t16_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(3 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2360_c7_f80c]
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2361_c3_d055]
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_7504]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_a812]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_a812]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_a812]
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_a812]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_a812]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2364_c7_a812]
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2364_c7_a812]
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2366_c30_5c22]
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_a4d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_7cd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_7cd0]
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_7cd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_7cd0]
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2371_c7_7cd0]
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_6902]
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output);

-- t16_MUX_uxn_opcodes_h_l2339_c2_72ff
t16_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff
n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff
n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_cond,
n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue,
n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse,
n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output);

-- t16_MUX_uxn_opcodes_h_l2352_c7_6e82
t16_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82
n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82
n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_cond,
n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue,
n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse,
n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output);

-- t16_MUX_uxn_opcodes_h_l2355_c7_dee6
t16_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6
n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6
n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_cond,
n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4
CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_x,
CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_f80c
t16_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c
n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c
n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_cond,
n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055
BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_left,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_right,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2364_c7_a812
n16_high_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2364_c7_a812
n16_low_MUX_uxn_opcodes_h_l2364_c7_a812 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_cond,
n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue,
n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse,
n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22
sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_ins,
sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_x,
sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_y,
sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0
n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond,
n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_left,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_right,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output,
 t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output,
 t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output,
 t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output,
 CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output,
 sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output,
 n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_5a97 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_5ffe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_7eaf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_3460 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_91d9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_f80c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_05db : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2374_c3_8844 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_099d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l2334_l2379_DUPLICATE_d1f2_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_91d9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_91d9;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_5ffe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_5ffe;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_3460 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_3460;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_5a97 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_5a97;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_7eaf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_7eaf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_05db := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_05db;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_f80c_return_output := result.stack_address_sp_offset;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_a6e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_7504] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_a1ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_7509] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_7369] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_099d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_099d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_a4d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2366_c30_5c22] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_ins;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_x;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output := sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_6902] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_a6e2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_7509_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_a1ab_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_7369_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_7504_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_a4d0_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2374_c3_8844 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_6902_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_099d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_099d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2352_l2355_l2371_l2360_DUPLICATE_32b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_6dff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2355_l2352_l2371_l2364_l2360_DUPLICATE_a58f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2352_l2364_l2355_l2360_DUPLICATE_7070_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2355_l2352_l2339_l2371_l2360_DUPLICATE_97c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_72ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_5c22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2374_c3_8844;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_7cd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_7cd0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output := result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_7cd0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2357_c3_61c4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output := CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_7cd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2361_c3_d055] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_left;
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output := BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2371_c7_7cd0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_cond;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output := n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_d055_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_61c4_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_7cd0_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_a812] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output := result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_a812_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_f80c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_f80c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_dee6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_dee6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- t16_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_6e82] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_6e82_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2339_c2_72ff] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_cond;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output := n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l2334_l2379_DUPLICATE_d1f2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l2334_l2379_DUPLICATE_d1f2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_72ff_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l2334_l2379_DUPLICATE_d1f2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l2334_l2379_DUPLICATE_d1f2_return_output;
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
