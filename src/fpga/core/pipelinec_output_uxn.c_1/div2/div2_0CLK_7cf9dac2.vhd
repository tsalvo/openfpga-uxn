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
-- Submodules: 73
entity div2_0CLK_7cf9dac2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7cf9dac2;
architecture arch of div2_0CLK_7cf9dac2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2107_c6_9983]
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2107_c2_5357]
signal n16_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2107_c2_5357]
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2107_c2_5357]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2107_c2_5357]
signal t16_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_d7ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2120_c7_c874]
signal n16_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2120_c7_c874]
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_c874]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_c874]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_c874]
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_c874]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_c874]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2120_c7_c874]
signal t16_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_c967]
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal n16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2123_c7_a74d]
signal t16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_0ada]
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal n16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2128_c7_ce88]
signal t16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2129_c3_bd6a]
signal BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2132_c11_9b02]
signal BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2132_c7_8942]
signal n16_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2132_c7_8942]
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2132_c7_8942]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2132_c7_8942]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2132_c7_8942]
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2132_c7_8942]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2132_c7_8942]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_2219]
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal n16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_7caa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2137_c3_4917]
signal BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_578e]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2138_c26_1360]
signal BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2138_c11_a91e]
signal MUX_uxn_opcodes_h_l2138_c11_a91e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2138_c11_a91e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2138_c11_a91e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2138_c11_a91e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2139_c30_4ef6]
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_b066]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_bed8]
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_bed8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_bed8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_bed8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2147_c31_7610]
signal CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_left,
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_right,
BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output);

-- n16_MUX_uxn_opcodes_h_l2107_c2_5357
n16_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
n16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
n16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2107_c2_5357
tmp16_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- t16_MUX_uxn_opcodes_h_l2107_c2_5357
t16_MUX_uxn_opcodes_h_l2107_c2_5357 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2107_c2_5357_cond,
t16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue,
t16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse,
t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2120_c7_c874
n16_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
n16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
n16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2120_c7_c874
tmp16_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- t16_MUX_uxn_opcodes_h_l2120_c7_c874
t16_MUX_uxn_opcodes_h_l2120_c7_c874 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2120_c7_c874_cond,
t16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue,
t16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse,
t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_left,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_right,
BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output);

-- n16_MUX_uxn_opcodes_h_l2123_c7_a74d
n16_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d
tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- t16_MUX_uxn_opcodes_h_l2123_c7_a74d
t16_MUX_uxn_opcodes_h_l2123_c7_a74d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond,
t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue,
t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse,
t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_left,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_right,
BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output);

-- n16_MUX_uxn_opcodes_h_l2128_c7_ce88
n16_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88
tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- t16_MUX_uxn_opcodes_h_l2128_c7_ce88
t16_MUX_uxn_opcodes_h_l2128_c7_ce88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond,
t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue,
t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse,
t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a
BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_left,
BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_right,
BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_left,
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_right,
BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output);

-- n16_MUX_uxn_opcodes_h_l2132_c7_8942
n16_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
n16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
n16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2132_c7_8942
tmp16_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_left,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_right,
BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output);

-- n16_MUX_uxn_opcodes_h_l2136_c7_7caa
n16_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa
tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917
BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_left,
BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_right,
BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_left,
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_right,
BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output);

-- MUX_uxn_opcodes_h_l2138_c11_a91e
MUX_uxn_opcodes_h_l2138_c11_a91e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2138_c11_a91e_cond,
MUX_uxn_opcodes_h_l2138_c11_a91e_iftrue,
MUX_uxn_opcodes_h_l2138_c11_a91e_iffalse,
MUX_uxn_opcodes_h_l2138_c11_a91e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6
sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_ins,
sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_x,
sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_y,
sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2147_c31_7610
CONST_SR_8_uxn_opcodes_h_l2147_c31_7610 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_x,
CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b
CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output,
 n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output,
 n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output,
 n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output,
 n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output,
 n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output,
 n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output,
 MUX_uxn_opcodes_h_l2138_c11_a91e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2112_c3_c238 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_15af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_3bf5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2126_c3_80ba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_ffcd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_312c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2142_c21_b6ac_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2145_c3_405c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_da73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2147_c21_8367_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2124_l2129_l2133_l2137_DUPLICATE_98bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_76d5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2151_l2103_DUPLICATE_49fe_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_15af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2117_c3_15af;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2145_c3_405c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2145_c3_405c;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_312c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2141_c3_312c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_da73 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2146_c3_da73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2112_c3_c238 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2112_c3_c238;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_ffcd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2130_c3_ffcd;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_3bf5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2121_c3_3bf5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2126_c3_80ba := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2126_c3_80ba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2132_c11_9b02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_left;
     BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output := BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2107_c2_5357_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_76d5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_76d5_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2128_c11_0ada] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_left;
     BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output := BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2124_l2129_l2133_l2137_DUPLICATE_98bd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2124_l2129_l2133_l2137_DUPLICATE_98bd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_b066] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_578e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2107_c2_5357_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2107_c2_5357_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2123_c11_c967] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_left;
     BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output := BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2139_c30_4ef6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_ins;
     sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_x;
     sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output := sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2136_c11_2219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_left;
     BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output := BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2147_c31_7610] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output := CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2107_c6_9983] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_left;
     BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output := BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2120_c11_d7ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2107_c2_5357_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2107_c6_9983_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2120_c11_d7ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2123_c11_c967_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2128_c11_0ada_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2132_c11_9b02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2136_c11_2219_return_output;
     VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_578e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_b066_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2124_l2129_l2133_l2137_DUPLICATE_98bd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2124_l2129_l2133_l2137_DUPLICATE_98bd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2124_l2129_l2133_l2137_DUPLICATE_98bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2132_l2128_DUPLICATE_5585_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2123_l2120_l2144_l2136_l2132_l2128_DUPLICATE_25a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2123_l2120_l2136_l2132_l2128_DUPLICATE_d0c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_76d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2144_l2132_DUPLICATE_76d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2123_l2120_l2107_l2144_l2132_l2128_DUPLICATE_ddbe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2107_c2_5357_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2107_c2_5357_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2107_c2_5357_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2107_c2_5357_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2139_c30_4ef6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2144_c7_bed8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2147_c21_8367] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2147_c21_8367_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2147_c31_7610_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2137_c3_4917] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_left;
     BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output := BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2129_c3_bd6a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_left;
     BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output := BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2144_c7_bed8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2144_c7_bed8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2129_c3_bd6a_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2137_c3_4917_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2147_c21_8367_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2125_l2134_DUPLICATE_8f5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l2138_c26_1360] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_left;
     BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output := BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- t16_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2144_c7_bed8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2138_c26_1360_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2144_c7_bed8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- n16_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     n16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     n16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- MUX[uxn_opcodes_h_l2138_c11_a91e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2138_c11_a91e_cond <= VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_cond;
     MUX_uxn_opcodes_h_l2138_c11_a91e_iftrue <= VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_iftrue;
     MUX_uxn_opcodes_h_l2138_c11_a91e_iffalse <= VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_return_output := MUX_uxn_opcodes_h_l2138_c11_a91e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- t16_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2142_c21_b6ac] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2142_c21_b6ac_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2138_c11_a91e_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- t16_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     t16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     t16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2142_c21_b6ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     t16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     t16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2136_c7_7caa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- n16_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2136_c7_7caa_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- n16_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     n16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     n16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2132_c7_8942] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output := result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2132_c7_8942_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     -- n16_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     n16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     n16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2128_c7_ce88] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output := result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2128_c7_ce88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2123_c7_a74d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2123_c7_a74d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2120_c7_c874] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output := result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2120_c7_c874_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2107_c2_5357] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output := result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2151_l2103_DUPLICATE_49fe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2151_l2103_DUPLICATE_49fe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2107_c2_5357_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2107_c2_5357_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2151_l2103_DUPLICATE_49fe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2151_l2103_DUPLICATE_49fe_return_output;
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
