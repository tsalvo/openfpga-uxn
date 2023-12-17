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
-- BIN_OP_EQ[uxn_opcodes_h_l2113_c6_65b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2113_c2_f503]
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c2_f503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2113_c2_f503]
signal t16_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2113_c2_f503]
signal n16_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2126_c11_5fb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal t16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2126_c7_79f6]
signal n16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2129_c11_346a]
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal t16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2129_c7_ab76]
signal n16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2134_c11_7b20]
signal BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal t16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2134_c7_fb20]
signal n16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2135_c3_c933]
signal BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_6250]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_ecff]
signal n16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_5ce9]
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2142_c7_c355]
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c7_c355]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c7_c355]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c7_c355]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_c355]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2142_c7_c355]
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2142_c7_c355]
signal n16_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2143_c3_943b]
signal BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_516d]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2144_c26_c526]
signal BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2144_c11_9709]
signal MUX_uxn_opcodes_h_l2144_c11_9709_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2144_c11_9709_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2144_c11_9709_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2144_c11_9709_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2145_c30_6ecf]
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_97c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_8b06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_8b06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2150_c7_8b06]
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2150_c7_8b06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2153_c31_0d24]
signal CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2113_c2_f503
tmp16_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- t16_MUX_uxn_opcodes_h_l2113_c2_f503
t16_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
t16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
t16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- n16_MUX_uxn_opcodes_h_l2113_c2_f503
n16_MUX_uxn_opcodes_h_l2113_c2_f503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2113_c2_f503_cond,
n16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue,
n16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse,
n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6
tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- t16_MUX_uxn_opcodes_h_l2126_c7_79f6
t16_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- n16_MUX_uxn_opcodes_h_l2126_c7_79f6
n16_MUX_uxn_opcodes_h_l2126_c7_79f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond,
n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue,
n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse,
n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_left,
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_right,
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76
tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- t16_MUX_uxn_opcodes_h_l2129_c7_ab76
t16_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- n16_MUX_uxn_opcodes_h_l2129_c7_ab76
n16_MUX_uxn_opcodes_h_l2129_c7_ab76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond,
n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue,
n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse,
n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_left,
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_right,
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20
tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- t16_MUX_uxn_opcodes_h_l2134_c7_fb20
t16_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- n16_MUX_uxn_opcodes_h_l2134_c7_fb20
n16_MUX_uxn_opcodes_h_l2134_c7_fb20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond,
n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue,
n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse,
n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933
BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_left,
BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_right,
BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff
tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_ecff
n16_MUX_uxn_opcodes_h_l2138_c7_ecff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_left,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_right,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2142_c7_c355
tmp16_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- n16_MUX_uxn_opcodes_h_l2142_c7_c355
n16_MUX_uxn_opcodes_h_l2142_c7_c355 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2142_c7_c355_cond,
n16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue,
n16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse,
n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b
BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_left,
BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_right,
BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_left,
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_right,
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output);

-- MUX_uxn_opcodes_h_l2144_c11_9709
MUX_uxn_opcodes_h_l2144_c11_9709 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2144_c11_9709_cond,
MUX_uxn_opcodes_h_l2144_c11_9709_iftrue,
MUX_uxn_opcodes_h_l2144_c11_9709_iffalse,
MUX_uxn_opcodes_h_l2144_c11_9709_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf
sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_ins,
sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_x,
sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_y,
sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24
CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_x,
CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d
CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output,
 tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output,
 MUX_uxn_opcodes_h_l2144_c11_9709_return_output,
 sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output,
 CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2118_c3_d567 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_5977 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_d2ac : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2132_c3_b0ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_545e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_e85c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_9709_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_9709_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_9709_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_9709_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_d4c3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_3655 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2151_c3_9727 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_b971_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2135_l2143_l2130_DUPLICATE_1420_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_e660_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2157_l2109_DUPLICATE_fdec_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2144_c11_9709_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_3655 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_3655;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_5977 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_5977;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_545e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_545e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_right := to_unsigned(5, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2132_c3_b0ec := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2132_c3_b0ec;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2151_c3_9727 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2151_c3_9727;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_e85c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_e85c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_d2ac := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_d2ac;
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2118_c3_d567 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2118_c3_d567;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_516d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2113_c2_f503_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_5ce9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2126_c11_5fb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2134_c11_7b20] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_left;
     BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output := BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2145_c30_6ecf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_ins;
     sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_x;
     sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output := sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_97c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_6250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2113_c6_65b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_e660 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_e660_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2113_c2_f503_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2129_c11_346a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2113_c2_f503_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l2153_c31_0d24] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output := CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2113_c2_f503_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2135_l2143_l2130_DUPLICATE_1420 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2135_l2143_l2130_DUPLICATE_1420_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_65b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_5fb8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_346a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_7b20_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_6250_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_5ce9_return_output;
     VAR_MUX_uxn_opcodes_h_l2144_c11_9709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_516d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_97c0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2135_l2143_l2130_DUPLICATE_1420_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2135_l2143_l2130_DUPLICATE_1420_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2135_l2143_l2130_DUPLICATE_1420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2150_l2138_l2134_l2129_l2126_DUPLICATE_2202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2150_l2142_l2138_l2134_l2129_l2126_DUPLICATE_2c31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2142_l2138_l2134_l2129_l2126_DUPLICATE_ed96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_e660_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_e660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2113_l2150_l2138_l2134_l2129_l2126_DUPLICATE_4655_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2113_c2_f503_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2113_c2_f503_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2113_c2_f503_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2113_c2_f503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_6ecf_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_8b06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2143_c3_943b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_left;
     BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output := BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2135_c3_c933] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_left;
     BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output := BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2153_c21_b971] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_b971_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_0d24_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2150_c7_8b06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_8b06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_c933_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_943b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_b971_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_372d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2150_c7_8b06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- t16_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- n16_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     n16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     n16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2144_c26_c526] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_left;
     BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output := BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2144_c11_9709_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_c526_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_8b06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- t16_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- MUX[uxn_opcodes_h_l2144_c11_9709] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2144_c11_9709_cond <= VAR_MUX_uxn_opcodes_h_l2144_c11_9709_cond;
     MUX_uxn_opcodes_h_l2144_c11_9709_iftrue <= VAR_MUX_uxn_opcodes_h_l2144_c11_9709_iftrue;
     MUX_uxn_opcodes_h_l2144_c11_9709_iffalse <= VAR_MUX_uxn_opcodes_h_l2144_c11_9709_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2144_c11_9709_return_output := MUX_uxn_opcodes_h_l2144_c11_9709_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := VAR_MUX_uxn_opcodes_h_l2144_c11_9709_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     -- t16_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- n16_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2148_c21_d4c3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_d4c3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2144_c11_9709_return_output);

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_d4c3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2142_c7_c355] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output := result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- n16_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- t16_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     t16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     t16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_c355_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_ecff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_ecff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- n16_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     n16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     n16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2134_c7_fb20] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output := result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_fb20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2129_c7_ab76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output := result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_ab76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2126_c7_79f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_79f6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2113_c2_f503] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output := result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2157_l2109_DUPLICATE_fdec LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2157_l2109_DUPLICATE_fdec_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_f503_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_f503_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2157_l2109_DUPLICATE_fdec_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2157_l2109_DUPLICATE_fdec_return_output;
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
