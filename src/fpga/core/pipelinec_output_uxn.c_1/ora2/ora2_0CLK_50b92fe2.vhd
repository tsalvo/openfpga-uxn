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
entity ora2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_50b92fe2;
architecture arch of ora2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1042_c6_8c99]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1042_c2_2b6f]
signal t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_f702]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_027d]
signal n16_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_027d]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_027d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_027d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_027d]
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_027d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_027d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1055_c7_027d]
signal t16_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_918c]
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1058_c7_4084]
signal n16_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1058_c7_4084]
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1058_c7_4084]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1058_c7_4084]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1058_c7_4084]
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1058_c7_4084]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1058_c7_4084]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1058_c7_4084]
signal t16_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_2b75]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal n16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1063_c7_c70e]
signal t16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1064_c3_a0ab]
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_84d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1067_c7_b204]
signal n16_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1067_c7_b204]
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_b204]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_b204]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1067_c7_b204]
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_b204]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_b204]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1071_c11_6e0a]
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1071_c7_2f6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1072_c3_2958]
signal BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1073_c11_737f]
signal BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1074_c30_bfeb]
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_b8e4]
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1079_c7_f570]
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_f570]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_f570]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_f570]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1082_c31_d89b]
signal CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output);

-- n16_MUX_uxn_opcodes_h_l1042_c2_2b6f
n16_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f
tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1042_c2_2b6f
t16_MUX_uxn_opcodes_h_l1042_c2_2b6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond,
t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue,
t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse,
t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_027d
n16_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_027d
tmp16_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- t16_MUX_uxn_opcodes_h_l1055_c7_027d
t16_MUX_uxn_opcodes_h_l1055_c7_027d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1055_c7_027d_cond,
t16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue,
t16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse,
t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_left,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_right,
BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output);

-- n16_MUX_uxn_opcodes_h_l1058_c7_4084
n16_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
n16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
n16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1058_c7_4084
tmp16_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- t16_MUX_uxn_opcodes_h_l1058_c7_4084
t16_MUX_uxn_opcodes_h_l1058_c7_4084 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1058_c7_4084_cond,
t16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue,
t16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse,
t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output);

-- n16_MUX_uxn_opcodes_h_l1063_c7_c70e
n16_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e
tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- t16_MUX_uxn_opcodes_h_l1063_c7_c70e
t16_MUX_uxn_opcodes_h_l1063_c7_c70e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond,
t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue,
t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse,
t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_left,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_right,
BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output);

-- n16_MUX_uxn_opcodes_h_l1067_c7_b204
n16_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
n16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
n16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1067_c7_b204
tmp16_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_left,
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_right,
BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output);

-- n16_MUX_uxn_opcodes_h_l1071_c7_2f6f
n16_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f
tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958
BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_left,
BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_right,
BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f
BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_left,
BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_right,
BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb
sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_ins,
sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_x,
sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_y,
sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_left,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_right,
BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_cond,
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b
CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_x,
CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1
CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output,
 n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output,
 n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output,
 n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output,
 n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output,
 n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output,
 CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1047_c3_bc1c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_7b2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_da8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_7a16 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_816d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_4fa0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c21_7d2f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1080_c3_4167 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_2b20 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1082_c21_f426_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1064_l1059_l1072_DUPLICATE_26c8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1067_l1079_DUPLICATE_dcde_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1086_l1038_DUPLICATE_17db_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_816d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_816d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_da8a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1056_c3_da8a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_7a16 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_7a16;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_4fa0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1076_c3_4fa0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_7b2e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1052_c3_7b2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1047_c3_bc1c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1047_c3_bc1c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_2b20 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1081_c3_2b20;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1080_c3_4167 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1080_c3_4167;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1079_c11_b8e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1071_c11_6e0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1058_c11_918c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1064_l1059_l1072_DUPLICATE_26c8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1064_l1059_l1072_DUPLICATE_26c8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c6_8c99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1067_l1079_DUPLICATE_dcde LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1067_l1079_DUPLICATE_dcde_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1074_c30_bfeb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_ins;
     sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_x;
     sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output := sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_f702] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l1082_c31_d89b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output := CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_84d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_2b75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c6_8c99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_f702_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1058_c11_918c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_2b75_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_84d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1071_c11_6e0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1079_c11_b8e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1064_l1059_l1072_DUPLICATE_26c8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1064_l1059_l1072_DUPLICATE_26c8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1068_l1064_l1059_l1072_DUPLICATE_26c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1067_DUPLICATE_0824_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1079_l1063_l1067_DUPLICATE_a635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1071_l1058_l1063_l1067_DUPLICATE_8b34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1067_l1079_DUPLICATE_dcde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1067_l1079_DUPLICATE_dcde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1055_l1058_l1079_l1063_l1042_l1067_DUPLICATE_1781_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1074_c30_bfeb_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1072_c3_2958] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_left;
     BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output := BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1079_c7_f570] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1079_c7_f570] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1082_c21_f426] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1082_c21_f426_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1082_c31_d89b_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1064_c3_a0ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_left;
     BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output := BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1079_c7_f570] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1064_c3_a0ab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1072_c3_2958_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1082_c21_f426_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1060_l1069_DUPLICATE_57c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1079_c7_f570] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output := result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1073_c11_737f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_left;
     BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output := BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1079_c7_f570_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1077_c21_7d2f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c21_7d2f_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1073_c11_737f_return_output);

     -- t16_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     t16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     t16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- n16_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     n16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     n16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1077_c21_7d2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1071_c7_2f6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- t16_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     t16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     t16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1071_c7_2f6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     -- t16_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1067_c7_b204] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output := result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- n16_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     n16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     n16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1067_c7_b204_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     -- n16_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_c70e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_c70e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1058_c7_4084] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output := result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1058_c7_4084_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_027d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_027d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1042_c2_2b6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1086_l1038_DUPLICATE_17db LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1086_l1038_DUPLICATE_17db_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1042_c2_2b6f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1086_l1038_DUPLICATE_17db_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l1086_l1038_DUPLICATE_17db_return_output;
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
